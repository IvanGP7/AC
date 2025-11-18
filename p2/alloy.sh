#!/bin/bash

# Uso: ./test_execute_alloy.sh <Archivo_config.cfg>
# Lanza SOLO las simulaciones del predictor Alloy con todas las configuraciones del enunciado

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <Archivo con parametros de sim-outorder (-config)>"
  exit 1
fi

CONFIG="$1"
PATH_SIM="../files/sim/simplesim-3.0_acx2"
PATH_BCH="../files/benchmarks"

BASE_OUT="resultados"
SIM_OUT_DIR="resultados/bpred_rate"
OUTPUT_ERR="output_logs"

mkdir -p "$BASE_OUT" "$SIM_OUT_DIR" "$OUTPUT_ERR"

# Ejecuta los 5 benchmarks con un TAG y flags de predictor
run_benchmarks() {
  TAG="$1"
  shift
  BPRED_FLAGS="$@"

  OUTDIR="$BASE_OUT/$TAG"
  mkdir -p "$OUTDIR"

  echo "=== Ejecutando: $TAG ==="

  echo "applu (1/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/applu.txt" \
    $PATH_BCH/applu/exe/applu.exe < $PATH_BCH/applu/data/ref/applu.in \
    > "$OUTPUT_ERR/${TAG}_applu.out" 2> "$OUTPUT_ERR/${TAG}_applu.err"

  echo "art (2/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/art.txt" \
    $PATH_BCH/art/exe/art.exe -scanfile $PATH_BCH/art/data/ref/c756hel.in \
    -trainfile1 $PATH_BCH/art/data/ref/a10.img -trainfile2 $PATH_BCH/art/data/ref/hc.img \
    -stride 2 -startx 470 -starty 140 -endx 520 -endy 180 -objects 10 \
    > "$OUTPUT_ERR/${TAG}_art.out" 2> "$OUTPUT_ERR/${TAG}_art.err"

  echo "gzip (3/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/gzip.txt" \
    $PATH_BCH/gzip/exe/gzip.exe \
      $PATH_BCH/gzip/data/ref/input.source 60 \
      $PATH_BCH/gzip/data/ref/input.log 60 \
      $PATH_BCH/gzip/data/ref/input.graphic 60 \
      $PATH_BCH/gzip/data/ref/input.random 60 \
      $PATH_BCH/gzip/data/ref/input.program 60 \
    > "$OUTPUT_ERR/${TAG}_gzip.out" 2> "$OUTPUT_ERR/${TAG}_gzip.err"

  echo "mesa (4/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/mesa.txt" \
    $PATH_BCH/mesa/exe/mesa.exe -frames 1000 \
      -meshfile $PATH_BCH/mesa/data/ref/mesa.in \
      -ppmfile $PATH_BCH/mesa/data/ref/mesa.ppm \
    > "$OUTPUT_ERR/${TAG}_mesa.out" 2> "$OUTPUT_ERR/${TAG}_mesa.err"

  echo "twolf (5/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/twolf.txt" \
    $PATH_BCH/twolf/exe/twolf.exe $PATH_BCH/twolf/data/ref/ref \
    > "$OUTPUT_ERR/${TAG}_twolf.out" 2> "$OUTPUT_ERR/${TAG}_twolf.err"
}

# Extrae bpred_dir_rate a un resumen por TAG
extract_bpred_rate() {
  TAG="$1"
  OUTDIR="$BASE_OUT/$TAG"
  OUTFILE="$SIM_OUT_DIR/${TAG}.txt"
  echo "==== $TAG ====" > "$OUTFILE"
  for f in "$OUTDIR"/*.txt; do
    if [ -f "$f" ]; then
      line=$(grep ".bpred_dir_rate" "$f" || true)
      if [ -n "$line" ]; then
        echo "$(basename "$f"): $line" >> "$OUTFILE"
      fi
    fi
  done
  echo "Resumen bpred_dir_rate: $OUTFILE"
}

# -----------------------------
#  Configuraciones ALLOY (enunciado)
#  -bpred alloy -bpred:alloy <l1> <l2> <p> <g> 0
# -----------------------------

Y=(  8   16   32    64    128   64 )
X=(  8   32   128   512   2048  4096 )
P=(  1    2    2     3      4    4  )
G=(  1    2    3     3      4    4  )

for i in "${!Y[@]}"; do
  TAG="alloy_Y${Y[$i]}_X${X[$i]}_p${P[$i]}_g${G[$i]}"
  echo ">>> Lanzando config Alloy: $TAG"
  run_benchmarks "$TAG" -bpred alloy -bpred:alloy "${Y[$i]}" "${X[$i]}" "${P[$i]}" "${G[$i]}" 0
  extract_bpred_rate "$TAG"
done

echo "Listo. Carpeta base de resultados: $BASE_OUT  | Resúmenes: $SIM_OUT_DIR"

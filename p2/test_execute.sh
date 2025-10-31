#!/bin/bash

# Uso: ./run_predictores.sh <Archivo con parametros>
# Guarda resultados en resultados/<TAG> donde TAG describe el predictor y sus parámetros

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <Archivo con parametros>"
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
  $PATH_BCH/gzip/exe/gzip.exe $PATH_BCH/gzip/data/ref/input.source 60 \
  $PATH_BCH/gzip/data/ref/input.log 60 $PATH_BCH/gzip/data/ref/input.graphic 60 \
  $PATH_BCH/gzip/data/ref/input.random 60 $PATH_BCH/gzip/data/ref/input.program 60 \
  > "$OUTPUT_ERR/${TAG}_gzip.out" 2> "$OUTPUT_ERR/${TAG}_gzip.err"

  echo "mesa (4/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/mesa.txt" \
  $PATH_BCH/mesa/exe/mesa.exe -frames 1000 -meshfile $PATH_BCH/mesa/data/ref/mesa.in \
  -ppmfile $PATH_BCH/mesa/data/ref/mesa.ppm \
  > "$OUTPUT_ERR/${TAG}_mesa.out" 2> "$OUTPUT_ERR/${TAG}_mesa.err"

  echo "twolf (5/5)"
  $PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS -redir:sim "$OUTDIR/twolf.txt" \
  $PATH_BCH/twolf/exe/twolf.exe $PATH_BCH/twolf/data/ref/ref \
  > "$OUTPUT_ERR/${TAG}_twolf.out" 2> "$OUTPUT_ERR/${TAG}_twolf.err"
}

# Extrae sim_IPC a un resumen por TAG
extract_ipc() {
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
  echo "Resumen sim_IPC: $OUTFILE"
}

# 1) Predictores simples
for P in nottaken taken perfect; do
  TAG="$P"
  run_benchmarks "$TAG" -bpred $P
  extract_ipc "$TAG"
done

# 2) Bimodal (bimod) con PHT: 8,32,128,512,2048
for X in 8 32 128 512 2048; do
  TAG="bimod_${X}"
  run_benchmarks "$TAG" -bpred bimod -bpred:bimod $X
  extract_ipc "$TAG"
done

# 3) Gshare: -bpred 2lev  -bpred:2lev 1 X log2(X) 1
for X in 8 32 128 512 2048; do
  if [ $X -eq 8 ]; then H=3
  elif [ $X -eq 32 ]; then H=5
  elif [ $X -eq 128 ]; then H=7
  elif [ $X -eq 512 ]; then H=9
  elif [ $X -eq 2048 ]; then H=11
  fi
  TAG="gshare_${X}"
  run_benchmarks "$TAG" -bpred 2lev -bpred:2lev 1 $X $H 1
  extract_ipc "$TAG"
done

# 4) GAg / Gselect: -bpred 2lev  -bpred:2lev 1 X log2(X) 0
for X in 8 32 128 512 2048; do
  if [ $X -eq 8 ]; then H=3
  elif [ $X -eq 32 ]; then H=5
  elif [ $X -eq 128 ]; then H=7
  elif [ $X -eq 512 ]; then H=9
  elif [ $X -eq 2048 ]; then H=11
  fi
  TAG="gag_${X}"
  run_benchmarks "$TAG" -bpred 2lev -bpred:2lev 1 $X $H 0
  extract_ipc "$TAG"
done

# 5) PAg: pares (Y-X): (4-4),(8-16),(16-64),(32-256),(64-1024),(32-2048)
Y=(4 8 16 32 64 32)
X=(4 16 64 256 1024 2048)
H=(2 4 6 8 10 11)

for i in ${!Y[@]}; do
  TAG="pag_Y${Y[$i]}_X${X[$i]}"
  run_benchmarks "$TAG" -bpred 2lev -bpred:2lev ${Y[$i]} ${X[$i]} ${H[$i]} 0
  extract_ipc "$TAG"
done

echo "Listo. Carpeta base de resultados: $BASE_OUT  | Resúmenes: $SIM_OUT_DIR"


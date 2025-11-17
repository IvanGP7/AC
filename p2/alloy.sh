#!/bin/bash

# Uso: ./run_alloy_applu.sh <configfile>
# Ejecuta una sola prueba con Alloy sobre applu
# y guarda el resultado en resultados/alloy_test

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <Archivo de configuración (p.ej. config.outorder)>"
  exit 1
fi

CONFIG="$1"
PATH_SIM="../files/sim/simplesim-3.0_acx2"
PATH_BCH="../files/benchmarks"

BASE_OUT="resultados"
SIM_OUT_DIR="resultados/bpred_rate"
OUTPUT_ERR="output_logs"

mkdir -p "$BASE_OUT" "$SIM_OUT_DIR" "$OUTPUT_ERR"

# TAG descriptivo de la prueba
TAG="alloy_test"

OUTDIR="$BASE_OUT/$TAG"
mkdir -p "$OUTDIR"

echo "=== Ejecutando predictor Alloy con applu ==="

# Ejemplo de configuración Alloy:
# -bpred alloy
# -bpred:alloy <l1size> <l2size> <p> <g> <0>
# Aquí uso (8,8,1,1,0) que corresponde a c=3, p=1, g=1, i=1
BPRED_FLAGS="-bpred alloy -bpred:alloy 8 8 1 1 0"

$PATH_SIM/sim-outorder -config "$CONFIG" $BPRED_FLAGS \
  -redir:sim "$OUTDIR/applu_alloy.txt" \
  $PATH_BCH/applu/exe/applu.exe < $PATH_BCH/applu/data/ref/applu.in \
  > "$OUTPUT_ERR/${TAG}_applu.out" 2> "$OUTPUT_ERR/${TAG}_applu.err"

echo "=== Extrayendo tasa de acierto del predictor (bpred_dir_rate) ==="

OUTFILE="$SIM_OUT_DIR/${TAG}.txt"
echo "==== $TAG ====" > "$OUTFILE"
line=$(grep ".bpred_dir_rate" "$OUTDIR/applu_alloy.txt" || true)
if [ -n "$line" ]; then
  echo "applu_alloy: $line" >> "$OUTFILE"
else
  echo "No se encontró .bpred_dir_rate en el log" >> "$OUTFILE"
fi

echo "Prueba terminada."
echo "  - Log completo:     $OUTDIR/applu_alloy.txt"
echo "  - Resumen Alloy:    $OUTFILE"
echo "  - Stdout/Stderr:    $OUTPUT_ERR/${TAG}_applu.out/.err"

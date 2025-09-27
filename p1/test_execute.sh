#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Expresion: $0 <Archivo con parametros>"
  exit 1
fi


PATH_SIM="../files/sim/simplesim-3.0_acx2"
PATH_BCH="../files/benchmarks"

NAME="${1%.txt}"

OUTPUT="resultados/$NAME"
SIM_OUTPUT="resultados/sim_IPC"
OUTPUT_ERR="output_logs"
mkdir -p $OUTPUT
mkdir -p $SIM_OUTPUT
mkdir -p $OUTPUT_ERR

TEST="applu"
echo "$TEST (1/5): Executing..."
$PATH_SIM/sim-outorder -config $1 -redir:sim $OUTPUT/$TEST.txt $PATH_BCH/applu/exe/applu.exe < $PATH_BCH/applu/data/ref/applu.in > $OUTPUT_ERR/applu.out 2> $OUTPUT_ERR/applu.err 


TEST="art"
echo "$TEST (2/5): Executing..."
$PATH_SIM/sim-outorder -config $1 -redir:sim $OUTPUT/$TEST.txt $PATH_BCH/art/exe/art.exe -scanfile $PATH_BCH/art/data/ref/c756hel.in -trainfile1 $PATH_BCH/art/data/ref/a10.img -trainfile2 $PATH_BC/art/data/ref/hc.img -stride 2 -startx 470 -starty 140 -endx 520 -endy 180 -objects 10 > $OUTPUT_ERR/art.out 2> $OUTPUT_ERR/art.err 


TEST="gzip"
echo "$TEST (3/5): Executing..."
$PATH_SIM/sim-outorder -config $1 -redir:sim $OUTPUT/$TEST.txt $PATH_BCH/gzip/exe/gzip.exe $PATH_BCH/gzip/data/ref/input.source 60 $PATH_BCH/gzip/data/ref/input.log 60 $PATH_BCH/gzip/data/ref/input.graphic 60 $PATH_BCH/gzip/data/ref/input.random 60 $PATH_BCH/gzip/data/ref/input.program 60 > $OUTPUT_ERR/gzip.out 2> $OUTPUT_ERR/gzip.err 


TEST="mesa"
echo "$TEST (4/5): Executing..."
$PATH_SIM/sim-outorder -config $1 -redir:sim $OUTPUT/$TEST.txt $PATH_BCH/mesa/exe/mesa.exe -frames 1000 -meshfile $PATH_BCH/mesa/data/ref/mesa.in -ppmfile $PATH_BCH/mesa/data/ref/mesa.ppm > $OUTPUT_ERR/mesa.out 2> $OUTPUT_ERR/mesa.err 


TEST="twolf"
echo "$TEST (5/5): Executing..."
$PATH_SIM/sim-outorder -config $1 -redir:sim $OUTPUT/$TEST.txt $PATH_BCH/twolf/exe/twolf.exe $PATH_BCH/twolf/data/ref/ref > $OUTPUT_ERR/twolf.out 2> $OUTPUT_ERR/twolf.err 


mkdir -p $SIM_OUTPUT
OUTFILE="$SIM_OUTPUT/$NAME.txt"
echo "" > "$OUTFILE"

for f in "$OUTPUT"/*.txt; do
    line=$(grep "sim_IPC" "$f")
    if [ -n "$line" ]; then
        echo "$(basename "$f"): $line" | tee -a "$OUTFILE"
    fi
done





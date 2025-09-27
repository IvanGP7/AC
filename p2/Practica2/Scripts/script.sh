#!/bin/bash

path=$(pwd)

resultados="Resultados/"
outputs="Output/"
errores="Errores/"

pruebas="${path}/Ficheros"

simplescalar=${pruebas}"/simplesim-3.0_acx2/sim-outorder"

fastswd="-fastfwd 100000000"
maxinst="-max:inst 100000000"
memwidth="-mem:width 32"
memlat="-mem:lat 300 2"

parametros="${fastswd} ${maxinst} ${memwidth} ${memlat}"

resultado="-redir:sim ${path}/${resultados}"

valores_gbhr=("1" "2" "3" "4" "5")
valores_pht=("4" "16" "64" "256" "1024")


#
#	AMMP
#
echo ammp
cd ${path}/Ficheros/ammp/data/ref

echo yags 4 1
${simplescalar} ${parametros} -bpred:yags 1 4 1 0 ${resultado}ammp_4_1.txt ../../exe/ammp.exe < ammp.in > ${path}/${outputs}ammp.out 2> ${path}/${errores}ammp.err

echo yags 16 2
${simplescalar} ${parametros} -bpred:yags 1 16 2 0 ${resultado}ammp_16_2.txt ../../exe/ammp.exe < ammp.in > ${path}/${outputs}ammp.out 2> ${path}/${errores}ammp.err

echo yags 64 3
${simplescalar} ${parametros} -bpred:yags 1 64 3 0 ${resultado}ammp_64_3.txt ../../exe/ammp.exe < ammp.in > ${path}/${outputs}ammp.out 2> ${path}/${errores}ammp.err

echo yags 256 4
${simplescalar} ${parametros} -bpred:yags 1 256 4 0 ${resultado}ammp_256_4.txt ../../exe/ammp.exe < ammp.in > ${path}/${outputs}ammp.out 2> ${path}/${errores}ammp.err

echo yags 1024 5
${simplescalar} ${parametros} -bpred:yags 1 1024 5 0 ${resultado}ammp_1024_5.txt ../../exe/ammp.exe < ammp.in > ${path}/${outputs}ammp.out 2> ${path}/${errores}ammp.err

echo ammp DONE
echo ""

#
#	APPLU
#
echo applu

cd ${path}

echo yags 4 1
${simplescalar} ${parametros} -bpred:yags 1 4 1 0 ${resultado}applu_4_1.txt Ficheros/applu/exe/applu.exe < Ficheros/applu/data/ref/applu.in > ${outputs}applu.out 2> ${errores}applu.err

echo yags 16 2
${simplescalar} ${parametros} -bpred:yags 1 16 2 0 ${resultado}applu_16_2.txt Ficheros/applu/exe/applu.exe < Ficheros/applu/data/ref/applu.in > ${outputs}applu.out 2> ${errores}applu.err

echo yags 64 3
${simplescalar} ${parametros} -bpred:yags 1 64 3 0 ${resultado}applu_64_3.txt Ficheros/applu/exe/applu.exe < Ficheros/applu/data/ref/applu.in > ${outputs}applu.out 2> ${errores}applu.err

echo yags 256 4
${simplescalar} ${parametros} -bpred:yags 1 256 4 0 ${resultado}applu_256_4.txt Ficheros/applu/exe/applu.exe < Ficheros/applu/data/ref/applu.in > ${outputs}applu.out 2> ${errores}applu.err

echo yags 1024 5
${simplescalar} ${parametros} -bpred:yags 1 1024 5 0 ${resultado}applu_1024_5.txt Ficheros/applu/exe/applu.exe < Ficheros/applu/data/ref/applu.in > ${outputs}applu.out 2> ${errores}applu.err

echo applu DONE
echo ""

#
#	EON
#
echo eon
cd ${path}/Ficheros/eon/data/ref

echo yags 4 1
${simplescalar} ${parametros} -bpred:yags 1 4 1 0 ${resultado}eon_4_1.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > ${path}/${outputs}eon.out 2> ${path}/${errores}eon.err

echo yags 16 2
${simplescalar} ${parametros} -bpred:yags 1 16 2 0 ${resultado}eon_16_2.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > ${path}/${outputs}eon.out 2> ${path}/${errores}eon.err

echo yags 64 3
${simplescalar} ${parametros} -bpred:yags 1 64 3 0 ${resultado}eon_64_3.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > ${path}/${outputs}eon.out 2> ${path}/${errores}eon.err

echo yags 256 4
${simplescalar} ${parametros} -bpred:yags 1 256 4 0 ${resultado}eon_256_4.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > ${path}/${outputs}eon.out 2> ${path}/${errores}eon.err

echo yags 1024 5
${simplescalar} ${parametros} -bpred:yags 1 1024 5 0 ${resultado}eon_1024_5.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > ${path}/${outputs}eon.out 2> ${path}/${errores}eon.err

echo eon DONE
echo ""

#
#	EQUAKE
#

echo equake
cd ${path}/Ficheros/equake/equake/data/ref

echo yags 4 1
${simplescalar} ${parametros} -bpred:yags 1 4 1 0 ${resultado}equake_4_1.txt ../../exe/equake.exe < inp.in > ${path}/${outputs}equake.out 2> ${path}/${errores}equake.err

echo yags 16 2
${simplescalar} ${parametros} -bpred:yags 1 16 2 0 ${resultado}equake_16_2.txt ../../exe/equake.exe < inp.in > ${path}/${outputs}equake.out 2> ${path}/${errores}equake.err

echo yags 64 3
${simplescalar} ${parametros} -bpred:yags 1 64 3 0 ${resultado}equake_64_3.txt ../../exe/equake.exe < inp.in > ${path}/${outputs}equake.out 2> ${path}/${errores}equake.err

echo yags 256 4
${simplescalar} ${parametros} -bpred:yags 1 256_4 0 ${resultado}equake_256_4.txt ../../exe/equake.exe < inp.in > ${path}/${outputs}equake.out 2> ${path}/${errores}equake.err

echo yags 1024 5
${simplescalar} ${parametros} -bpred:yags 1 1024 5 0 ${resultado}equake_1024_5.txt ../../exe/equake.exe < inp.in > ${path}/${outputs}equake.out 2> ${path}/${errores}equake.err

echo equake DONE
echo ""

#
#	VPR
#

echo vpr
cd ${path}/Ficheros/vpr/data/ref

echo yags 4 1
${simplescalar} ${parametros} -bpred:yags 1 4 1 0 ${resultado}vpr_4_1.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412  -inner_num 2 > ${path}/${outputs}vpr.out 2> ${path}/${errores}vpr.err

echo yags 16 2
${simplescalar} ${parametros} -bpred:yags 1 16 2 0 ${resultado}vpr_16_2.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412  -inner_num 2 > ${path}/${outputs}vpr.out 2> ${path}/${errores}vpr.err

echo yags 64 3
${simplescalar} ${parametros} -bpred:yags 1 64 3 0 ${resultado}vpr_64_3.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412  -inner_num 2 > ${path}/${outputs}vpr.out 2> ${path}/${errores}vpr.err

echo yags 256 4
${simplescalar} ${parametros} -bpred:yags 1 256 4 0 ${resultado}vpr_256_4.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412  -inner_num 2 > ${path}/${outputs}vpr.out 2> ${path}/${errores}vpr.err

echo yags 1024 5
${simplescalar} ${parametros} -bpred:yags 1 1024 5 0 ${resultado}vpr_1024_5.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412  -inner_num 2 > ${path}/${outputs}vpr.out 2> ${path}/${errores}vpr.err

echo vpr DONE
echo ""







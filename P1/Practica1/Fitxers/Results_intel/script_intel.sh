echo Intel

#Funciona
cd Benchmarks/ammp/data/ref
../../../../simplesim-3.0_acx2/sim-outorder -config ../../../../config_intel -redir:sim ../../../../Results_intel/ammp.txt ../../exe/ammp.exe < ammp.in
echo AMMP Done


#Comentado pq ya funciona
cd /home/milax/Escriptori/AC_24_25
simplesim-3.0_acx2/sim-outorder -config config_intel -redir:sim Results_intel/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in > Prova/applu.out 2> Prova/applu.err 
echo APPLU Done

cd /home/milax/Escriptori/AC_24_25
cd Benchmarks/eon/data/ref
../../../../simplesim-3.0_acx2/sim-outorder -config ../../../../config_intel -redir:sim ../../../../Results_intel/eon.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook
#simplesim-3.0_acx2/sim-outorder -config config_intel -redir:sim Results_intel/eon.txt Benchmarks/eon/exe/eon.exe < Benchmarks/eon/data/ref/* > Prova/eon.out 2> Prova/eon.err 
echo EON Done

#Ya funciona
cd /home/milax/Escriptori/AC_24_25
cd Benchmarks/equake/equake/data/ref
../../../../../simplesim-3.0_acx2/sim-outorder -config ../../../../../config_intel -redir:sim ../../../../../Results_intel/equake.txt ../../exe/equake.exe < inp.in
#simplesim-3.0_acx2/sim-outorder -config config_intel -redir:sim Results_intel/equake.txt Benchmarks/equake/exe/equake.exe < Benchmarks/equake/equake/data/ref/inp.in > Prova/equake.out 2> Prova/equake.err 
echo EQUAKE Done



cd /home/milax/Escriptori/AC_24_25
#Comentado pq ya funciona
simplesim-3.0_acx2/sim-outorder -config config_intel -redir:sim Results_intel/vpr.txt Benchmarks/vpr/exe/vpr.exe Benchmarks/vpr/data/ref/net.in Benchmarks/vpr/data/ref/arch.in Benchmarks/vpr/data/ref/route.out -nodisp -route_only -route_chan_width 15 -pres_fac_mult 2 -acc_fac 1 -first_iter_pres_fac 4 -initial_pres_fac 8 > Prova/route_log.out 2> Prova/route_log.err
echo VPR Done


echo FIN
cd /home/milax/Escriptori/AC_24_25
cd Results_intel
grep '^sim_IPC' *.txt > Results.txt
cd ..
mv Results_intel/Results.txt Results.txt
cat Results.txt

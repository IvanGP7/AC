# Simulacions del yags
sudo mkdir -p ../Results


RESULTS="../Results/yags"

FOLDER=$(pwd)

cd ../Code/simplesim-3.0_acx2/
EXEC_FOLDER=$(pwd)
SIMPLESIM="$EXEC_FOLDER/sim-outorder"
cd $FOLDER

cd ../Benchmarks
BENCH=$(pwd)
cd $FOLDER

cd ../Results
RESULTS=$(pwd)
RESULTS="$RESULTS/yags"
cd $FOLDER
sudo mkdir -p $RESULTS

cd $BENCH/ammp/data/ref
sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp_1.txt ../../exe/ammp.exe < ammp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp_2.txt ../../exe/ammp.exe < ammp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp_3.txt ../../exe/ammp.exe < ammp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp_4.txt ../../exe/ammp.exe < ammp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp_5.txt ../../exe/ammp.exe < ammp.in


#applu
cd $BENCH/applu/data/ref
sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu_1.txt ../../exe/applu.exe < applu.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu_2.txt ../../exe/applu.exe < applu.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu_3.txt ../../exe/applu.exe < applu.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu_4.txt ../../exe/applu.exe < applu.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu_5.txt ../../exe/applu.exe < applu.in

#eon
cd $BENCH/eon/data/ref
sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon_1.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon_2.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon_3.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon_4.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon_5.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

#equake
cd $BENCH/equake/data/ref
sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake_1.txt ../../exe/equake.exe < inp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake_2.txt ../../exe/equake.exe < inp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake_3.txt ../../exe/equake.exe < inp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake_4.txt ../../exe/equake.exe < inp.in

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake_5.txt ../../exe/equake.exe < inp.in

#vpr
cd $BENCH/vpr/data/ref
sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr_1.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr_2.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr_3.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr_4.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sudo $SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr_5.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2
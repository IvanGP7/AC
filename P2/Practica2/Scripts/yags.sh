# Simulacions del yags
sudo mkdir -p ../Results

SIMPLESIM="../Code/simplesim-3.0_acx2/sim-outorder"
RESULTS="../Results/yags"
BENCH="../Benchmarks"

#ammp
cd $BENCH/ammp/data/ref
$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp.txt ../../exe/ammp.exe < ammp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp.txt ../../exe/ammp.exe < ammp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp.txt ../../exe/ammp.exe < ammp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp.txt ../../exe/ammp.exe < ammp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/ammp.txt ../../exe/ammp.exe < ammp.in


#applu
cd $BENCH/applu/data/ref
$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu.txt ../../exe/applu.exe < applu.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu.txt ../../exe/applu.exe < applu.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu.txt ../../exe/applu.exe < applu.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu.txt ../../exe/applu.exe < applu.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/applu.txt ../../exe/applu.exe < applu.in

#eon
cd $BENCH/eon/data/ref
$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/eon.txt ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

#equake
cd $BENCH/equake/equake/data/ref
$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake.txt ../../exe/equake.exe < inp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake.txt ../../exe/equake.exe < inp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake.txt ../../exe/equake.exe < inp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake.txt ../../exe/equake.exe < inp.in

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/equake.txt ../../exe/equake.exe < inp.in

#vpr
cd $BENCH/vpr/data/ref
$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 4 1 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 16 2 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 64 3 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 256 4 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

$SIMPLESIM -fastfwd 100000000 -max:inst 100000000 -bpred yags -bpred:yags 1 1024 5 0 -mem:width 32 -mem:lat 300 2 -redir:sim $RESULTS/vpr.txt ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

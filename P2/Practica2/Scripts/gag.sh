#Simulacions gag

# 1 <X> <log2X> 0

# <l1size> <l2size> <hist_size> <xor>
# L1size : número d'entrades del Branch History Register
# L2size: número d'entrades del Pattern History Table
# Hist_size: número de bits d'historia dels salts
# Xor: 0 → concatenació de PC+BHR, 1-> Xor de PC+BHR


#ammp
cd
cd EC/Eines/SPEC-Files/ammp/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 8 3 0 -mem:width 32 -mem:lat 300 2 ../../exe/ammp.exe < ammp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 32 5 0 -mem:width 32 -mem:lat 300 2 ../../exe/ammp.exe < ammp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 128 7 0 -mem:width 32 -mem:lat 300 2 ../../exe/ammp.exe < ammp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 512 9 0 -mem:width 32 -mem:lat 300 2 ../../exe/ammp.exe < ammp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 2048 11 0 -mem:width 32 -mem:lat 300 2 ../../exe/ammp.exe < ammp.in


#applu
cd
cd EC/Eines/SPEC-Files/applu/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 8 3 0 -mem:width 32 -mem:lat 300 2 ../../exe/applu.exe < applu.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 32 5 0 -mem:width 32 -mem:lat 300 2 ../../exe/applu.exe < applu.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 128 7 0 -mem:width 32 -mem:lat 300 2 ../../exe/applu.exe < applu.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 512 9 0 -mem:width 32 -mem:lat 300 2 ../../exe/applu.exe < applu.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 2048 11 0 -mem:width 32 -mem:lat 300 2 ../../exe/applu.exe < applu.in

#eon
cd
cd EC/Eines/SPEC-Files/eon/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 8 3 0 -mem:width 32 -mem:lat 300 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 32 5 0 -mem:width 32 -mem:lat 300 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 128 7 0 -mem:width 32 -mem:lat 300 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 512 9 0 -mem:width 32 -mem:lat 300 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 2048 11 0 -mem:width 32 -mem:lat 300 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

#equake
cd
cd EC/Eines/SPEC-Files/equake/equake/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 8 3 0 -mem:width 32 -mem:lat 300 2 ../../exe/equake.exe < inp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 32 5 0 -mem:width 32 -mem:lat 300 2 ../../exe/equake.exe < inp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 128 7 0 -mem:width 32 -mem:lat 300 2 ../../exe/equake.exe < inp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 512 9 0 -mem:width 32 -mem:lat 300 2 ../../exe/equake.exe < inp.in

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 2048 11 0 -mem:width 32 -mem:lat 300 2 ../../exe/equake.exe < inp.in

#vpr
cd
cd EC/Eines/SPEC-Files/vpr/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 8 3 0 -mem:width 32 -mem:lat 300 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 32 5 0 -mem:width 32 -mem:lat 300 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 128 7 0 -mem:width 32 -mem:lat 300 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 512 9 0 -mem:width 32 -mem:lat 300 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred 2lev -bpred:2lev 1 2048 11 0 -mem:width 32 -mem:lat 300 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

#Simulacions nottaken

#ammp
cd
cd EC/Eines/SPEC-Files/ammp/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred nottaken -mem:width 32 -mem:lat 300 2 ../../exe/ammp.exe < ammp.in


#applu
cd
cd EC/Eines/SPEC-Files/applu/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred nottaken -mem:width 32 -mem:lat 300 2 ../../exe/applu.exe < applu.in

#eon
cd
cd EC/Eines/SPEC-Files/eon/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred nottaken -mem:width 32 -mem:lat 300 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

#equake
cd
cd EC/Eines/SPEC-Files/equake/equake/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred nottaken -mem:width 32 -mem:lat 300 2 ../../exe/equake.exe < inp.in

#vpr
cd
cd EC/Eines/SPEC-Files/vpr/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -bpred nottaken -mem:width 32 -mem:lat 300 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

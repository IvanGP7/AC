#COMANDES SIMULACIÓ AMD Ryzen 5 7600X
# <name>:<nsets>:<bsize>:<assoc>:<repl>

#ammp
cd
cd EC/Eines/SPEC-Files/ammp/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -cache:dl1 dl1:64:32:16:l -cache:il1 il1:64:32:16:l -cache:dl2 ul2:2048:64:16:l -fetch:ifqsize 6 -decode:width 4 -issue:width 14 -commit:width 8 -ruu:size 512 -lsq:size 128 -mem:lat 48 1 -mem:width 32 -res:ialu 6 -res:imult 2 -res:memport 2 -res:fpalu 2 -res:fpmult 2 ../../exe/ammp.exe < ammp.in


#applu
cd
cd EC/Eines/SPEC-Files/applu/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -cache:dl1 dl1:64:32:16:l -cache:il1 il1:64:32:16:l -cache:dl2 ul2:2048:64:16:l -fetch:ifqsize 6 -decode:width 4 -issue:width 14 -commit:width 8 -ruu:size 512 -lsq:size 128 -mem:lat 48 1 -mem:width 32 -res:ialu 6 -res:imult 2 -res:memport 2 -res:fpalu 2 -res:fpmult 2 ../../exe/applu.exe < applu.in 

#eon
cd
cd EC/Eines/SPEC-Files/eon/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -cache:dl1 dl1:64:32:16:l -cache:il1 il1:64:32:16:l -cache:dl2 ul2:2048:64:16:l -fetch:ifqsize 6 -decode:width 4 -issue:width 14 -commit:width 8 -ruu:size 512 -lsq:size 128 -mem:lat 48 1 -mem:width 32 -res:ialu 6 -res:imult 2 -res:memport 2 -res:fpalu 2 -res:fpmult 2 ../../exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook

#equake
cd
cd EC/Eines/SPEC-Files/equake/equake/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -cache:dl1 dl1:64:32:16:l -cache:il1 il1:64:32:16:l -cache:dl2 ul2:2048:64:16:l -fetch:ifqsize 6 -decode:width 4 -issue:width 14 -commit:width 8 -ruu:size 512 -lsq:size 128 -mem:lat 48 1 -mem:width 32 -res:ialu 6 -res:imult 2 -res:memport 2 -res:fpalu 2 -res:fpmult 2 ../../exe/equake.exe < inp.in

#vpr
cd
cd EC/Eines/SPEC-Files/vpr/data/ref
sim-outorder -fastfwd 100000000 -max:inst 100000000 -cache:dl1 dl1:64:32:16:l -cache:il1 il1:64:32:16:l -cache:dl2 ul2:2048:64:16:l -fetch:ifqsize 6 -decode:width 4 -issue:width 14 -commit:width 8 -ruu:size 512 -lsq:size 128 -mem:lat 48 1 -mem:width 32 -res:ialu 6 -res:imult 2 -res:memport 2 -res:fpalu 2 -res:fpmult 2 ../../exe/vpr.exe net.in arch.in place.out dum.out -nodisp -place_only -init_t 5 -exit_t 0.005 -alpha_t 0.9412 -inner_num 2

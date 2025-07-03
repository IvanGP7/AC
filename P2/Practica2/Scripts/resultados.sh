#!/bin/bash
grep '.bpred_dir_rate' Resultados/*.txt > resultados_finales.txt
grep '(1 <Entradas PHT X> <Longitud GBHR g> 0)' Resultados/*.txt > resultados_finales2.txt

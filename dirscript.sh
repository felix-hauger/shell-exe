#!/bin/bash
for i in {1..9} 
do mkdir "Job_$i" && chmod -R 774 "Job_$i"
done

#!bin/bash
#borrador

file=$(find . -name "*.swp")

for f in $file
do
	rm $f
done

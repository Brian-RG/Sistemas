#A01633401-homework-03


#Counting number of files per directory
n=$(find . -type f | wc -l)
echo "total files: $n"
Files=$(find . -maxdepth 1 -type d)
ar=1
for file in $Files

do
	echo
	archivos=$(find $file -type f | wc -l)
	if [ $ar -eq 1 ]
	then
		echo "Número total de archivos:$archivos"
		ar=$((ar+1))
	else
	echo
	#Devuelve el numero de archivos por cada directorio
	echo "Directorio: $file"
	echo "Numero de archivos: $archivos"
	fi
done


#Files in kernel source doce

echo
echo
echo "------------------------------------------------------------------------------"
echo
echo

kernelfiles=$(find . -type f | wc -l)
Readme=$(find . -iname "Readme" | wc -l)
Kconf=$(find . -iname "Kconf*" | wc -l)
Kbuild=$(find . -iname "Kbuild*" | wc -l)
Makefile=$(find . -iname "Makefile*" | wc -l)
C=$(find . -name "*.c" | wc -l)
H=$(find . -name "*.h" | wc -l)
pl=$(find . -name "*.pl" | wc -l)
All=$((Readme+Kconf+Kbuild+Makefile+C+H+pl))
other=$((kernelfiles-All))

echo "#Number of README: $Readme"
echo "#Number of KConfig: $Kconf"
echo "#Number of Kbuild: $Kbuild"
echo "#Number of Makefile: $Makefile"
echo "#Number of .c : $C"
echo "#Number of .h : $H"
echo "#Number of .pl : $pl"
echo "#Number of other files: $other"
echo
echo "#Total number of files: $kernelfiles"


#D, files que contengan un string.
contador=0
check=$(find . -type f)
for f in $check
do
	if  grep -q "#include <linux/module.h>" $f 
	then
	contador=$((contador+1))
	fi
done

echo "---------------------------------------------------------------"
echo "#Numero de archivos que contienen #include <linux/module.h> : $contador" 
echo "---------------------------------------------------------------"

#e) Copiar los archivos

cfiles=$(find . -name "*.c")
hfiles=$(find . -name "*.h")

for x in $cfiles
do
	cp $x /mnt/c/os/lin/C_FILES/
done


for y in $hfiles
do
	cp $y /mnt/c/os/lin/H_FILES/
done


#contando

c_count=$(find /mnt/c/os/lin/C_FILES/ -name "*.c" | wc -l)
h_count=$(find /mnt/c/os/lin/H_FILES/ -name "*.h" | wc -l)

echo "Archivos .c en la carpeta destino: $c_count"
echo "Archivos .h en la carpeta destino: $h_count"

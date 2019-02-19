# 
# Valdemar Duk    02/12/2019
#
#This script print specific elements from the /home/project/data file to the 
#terminal (prints sum if valid entry)


#!
array=($(cat "./data"))
count=1 		#serves as index
let "max = $1+1"	# limit of items per line allowed in file 
			# (after 1st element in this case)
#if [ $# != 0 ]then
	while [ $count -lt 6 ]
	do
		echo ${array[count]}
		let "count = count + 1"
	done
		let "result= $array[1]+$array[2]+array[3]+array[4]+array[5]"
		echo Result: $result

#else
#	for i in "${array[@]}"
#	do
#		echo $i
#	done
#fi

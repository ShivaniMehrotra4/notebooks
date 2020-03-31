#!/bin/bash
#
# SCRIPT: sed-free
# AUTHOR: Shivani
# DATE:   27/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: ubuntu
# 
# PURPOSE: The output od the script should be like the free command. (using sed)
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
 set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #

memFilePath="/proc/meminfo"
today=$(date)

totalMemory=$(sed -n '/MemTotal/p' $memFilePath)
freeMemory=$(sed -n '/MemFree/p' $memFilePath)
availableMemory=$(sed -n '/MemAvailable/p' $memFilePath)
buffers=$(sed -n '/Buffers/p' $memFilePath)
cached=$(sed -n '/^Cached/p' $memFilePath)
################################################################

################################################################
#          Define Functions here                               #

print_memory_info(){

	arg=$1
	case ${arg} in 

		free)
			flagValue=$2
			case ${flagValue} in
				-m) echo "You chose free -m"
					echo -e "The Total memory available is \t : $totalMemory"
					echo -e "The Free memory available is \t : $freeMemory"
					echo -e "The memory available is \t : $availableMemory"
					echo -e "The buffer available is \t : $buffers"
					echo -e "The cache memory available is \t : $cached"
				;;

				-h) echo "You chose free -h"
					echo -e "The Total memory available is \t : $totalMemory"
					echo -e "The Free memory available is \t : $freeMemory"
					echo -e "The memory available is \t : $availableMemory"
					echo -e "The buffer available is \t : $buffers"
					echo -e "The cache memory available is \t : $cached"
				;;

				-g) echo "You chose free -g"
					echo -e "The Total memory available is \t : $totalMemory/10000000"
					echo -e "The Free memory available is \t : $freeMemory/10000000"
					echo -e "The memory available is \t : $availableMemory/10000000"
					echo -e "The buffer available is \t : ${buffers}/10000000"
					echo -e "The cache memory available is \t : $cached/10000000"
				;;
				*) 
				echo "You didn't choose a valid free tag."
				;;

			esac
		;;

		*) 
		echo "You didn't choose the correct option / anything."
		;;

	esac
}

################################################################

################################################################
#          Beginning of Main                                   #
print_memory_info $1 $2
################################################################
# End of script

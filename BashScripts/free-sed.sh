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

################################################################

################################################################
#          Define Functions here                               #

print_sed_free_info(){
	echo -e "------------- $today ------------- \n"
	sed -n '/MemTotal/p' $memFilePath 
	sed -n '/MemFree/p' $memFilePath
	sed -n '/MemAvailable/p' $memFilePath
	sed -n '/Buffers/p' $memFilePath
	sed -n '/^Cached/p' $memFilePath
}


################################################################

################################################################
#          Beginning of Main                                   #
print_sed_free_info
################################################################
# End of script

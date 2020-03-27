#!/bin/bash
#
# SCRIPT: try2
# AUTHOR: Shivani Mehrotra
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: To run free command through a script using grep for filtering. Also only function have been used here.
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
################################################################

fileName="/proc/meminfo"
touch memoryInfo.txt

#totalMemory
grep -i "MemTotal" $fileName >> memoryInfo.txt
#freeMemory
grep -i "MemFree" $fileName >> memoryInfo.txt
#availableMemory
grep -i "MemAvailable" $fileName >> memoryInfo.txt
#buffers
grep -i "Buffers" $fileName >> memoryInfo.txt
#cached
grep -i "^Cached" $fileName >> memoryInfo.txt

################################################################
#          Define Functions here                               #
################################################################

print_memory_info(){
cat memoryInfo.txt
rm memoryInfo.txt
}

################################################################
#          Beginning of Main                                   #
################################################################

print_memory_info

# End of script

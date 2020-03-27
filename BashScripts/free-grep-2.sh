#!/bin/bash
#
# SCRIPT: free-grep-2
# AUTHOR: Shivani Mehrotra
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: To run free command through a script using grep for filtering. Also only variables have been used here.
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

totalMemory=$(grep -i "MemTotal" $fileName)
freeMemory=$(grep -i "MemFree" $fileName)
availableMemory=$(grep -i "MemAvailable" $fileName)
buffers=$(grep -i "Buffers" $fileName)
cached=$(grep -i "^Cached" $fileName)

################################################################
#          Define Functions here                               #
################################################################

print_memory_info(){
echo -e "The Total memory available is \t : $totalMemory"
echo -e "The Free memory available is \t : $freeMemory"
echo -e "The memory available is \t : $freeMemory"
echo -e "The buffer available is \t : $totalMemory"
echo -e "The cache memory available is \t : $totalMemory"
}

################################################################
#          Beginning of Main                                   #
################################################################

print_memory_info

# End of script
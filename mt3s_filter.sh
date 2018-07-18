#!/bin/bash
# 
# USAGE:
#   $0 [year] |less     # visually confirm correct output
#   $0 [year] |bash     # execute output.  dangerous!
#   
# Warning: 
#   The output of this script is NOT protected against 
#   funny characters in filenames or other bugs/unusual output.
#   That's why this script does NOT change any file!
#   It outputs a guess at the commands to perform the desired change.
#   YOU MUST VISUALLY INSPECT THE OUTPUT BEFORE EXECUTING IT
#  


# set variable values.
# also set values inside is_mt3 and process_files.
year=2017
year=${1:-$year}



# return value is an exit status
is_mt3() {
  local f="$1"
    
  # set these values
  local num_lines=3
  local string="mt3"

  # grep's exit code is 
  head -n$num_lines "$f" |grep "$string" >/dev/null
  local status=$?

  if [ $status == 0 ]; then return 1; fi   # yes mt3 was found
  if [ $status == 1 ]; then return 0; fi   # no, mt3 was not found
  return 0;                                # error code
}
  

# do a thing if file is an mt3 file
process_file() {
  local g="$1"
   
  # set these values 
  local mt3_dest_dir=mt3s
    
  if is_mt3 "$g"   # need quotes in case filename has whitespace
  then
    # crude echo command, that does NOT escape anything!
    # output is very vulnerable to funny chars in filename [;"\/]
    echo cp \"$g\"    \"$mt3_dest_dir\"
  fi
}

export -f is_mt3
export -f process_file
export -v mt3_dest_dir

echo mkdir -p \"$mt3_dest_dir\"
 

# main()
# only the shell can execute shell functions,
# and so -exec has to run a shell:
find $year -type f -exec bash -c 'process_file {}' \;



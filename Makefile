# *****************************************************************************
# Author: John Kim
# Date Created: 2020-08-30
# Last Updated: 2020-09-17
# Note: Makefile for reprocess.py & short_Key_Table_keycheck.py
# *****************************************************************************

##### User-defined START #####

# Modules & Parameters
DIR = `pwd`
MULTIPROCESS = ${DIR}/multiprocess
REPROCESS = ${DIR}/short_Key_Table_reprocess
KEYCHECK = ${DIR}/short_Key_Table_keycheck
N_CORES = 5

# Aesthetics
whitespace = "                "
divider = "********************************************************************"

##### User-defined END #####

all: welcome prepshell reprocess keycheck

welcome:
  @echo ${divider}
  @echo ${whitespace}"     Welcome to     "
  @echo ${whitespace}"   MASK INSPECTOR   "
  @echo ${divider}

prepshell:
  # Remove previously created shell script and XXXXX_Plain_K*"
  @rm -rf ${REPROCESS}.sh XXXXX_Plain_K*;\
  # For every raw input, if it exists and doesn't end with *_Reprocess", then print a Python command to a new shell
  @for input in ${DIR}/XXXXX_Total_*; do\
    if [ -s $${input} ] && [[ $${input} != *"_Reprocess"* ]]; then \
      echo "python ${DIR}/short_Key_Table_reprocess.py $${input}" >> ${REPROCESS}.sh;\
    fi;\
  done;\


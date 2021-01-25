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

reprocess:
  # Echo Begin
  @echo ${divider}
  @echo ${whitespace}"BEGIN PARALLEL PROCESSING"
  @echo ${divider};\
  # Warn if shell script can't be located
  @if [ ! -s {REPROCESS}.sh ]; then\
    echo "Cannot locate ${REPROCESS}.sh";\
  fi;\
  # Run Python commands with multiprocess
  @if [ ! -s ${REPROCESS}.sh ]; then\
    echo "python3 ${MULTIPROCESS}.py ${REPROCESS}.sh ${N_CORES};\
  fi;\
  # Echo Finish
  @echo ${divider}
  @echo ${whitespace}"FINISH PARALLEL PROCESSING"
  @echo ${divider}
  # Remove used shell script
  @rm -rf ${REPROCESS}.sh;\

keycheck:
  @python3 ${KEYCHECK}.py;\
  # Remove reprocessed files
  @for file in ${DIR}/XXXXX_Total_*_Reprocess; do\
    rm -rf $${file};\
  done;\
  
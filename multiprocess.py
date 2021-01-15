#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# *****************************************************************************
# Author: John Kim
# Date Created: 2020-08-25
# Last Updated: 2020-09-17
# Note: Parallelize short_Key_Table_reprocess.py
# *****************************************************************************
import datetime
import os, sys, subprocess, multiprocessing
from multiprocessing import Pool

######
def run(cmd):
  print(cmd)
  log = subprocess.getoutput(cmd)
  print(log)
######
######
def main():
  runFileName     = sys.argv[1]
  cpuCoreUse      = int(sys.argv[2])

  runFile         = open(runFileName, 'r')
  tasks           = runFile.readlines()
  runFile.close()

  cpuCoreUse = max(min(cpuCoreUse, len(tasks)), 1)
  totalNum = len(tasks)
  pool = Pool(cpuCoreUse)
  jobs = []
  print(' * TOTAL # OF CORES: ', cpuCoreUse)
  print(' * TOTAL # OF FILES: ', totalNum, '\n')

  for i, task in enumerate(tasks):
    pool.apply_async(run, args = (task,))
  pool.close()
  pool.join()
######
######
if __name__ == '__main__':
  start_time = datetime.datetime.now()
  main()
  elapsed_time = (datetime.datetime.now() - start_time).total_seconds()
  minutes = int(elapsed_time//60)
  seconds = elapsed_time&60
  print(' * XXXXX_Plain_K0 CREATED')
  print(' * ELAPSED TIME: ', minutes, 'min', seconds, 'sec')
######
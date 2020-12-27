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

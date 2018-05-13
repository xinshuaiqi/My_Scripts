#!/usr/bin/env python
#########################################################
##              StrAuto Version 0.3.1                  ##
##     A Python program to aid in the automation of    ##
##       STRUCTURE Program (Pritchard et al)           ##
##              Vikram E. Chhatre                      ##  
##             Texas A&M University                    ##  
##         crypticlineage (at) gmail.com               ##   
#########################################################

## Import libraries we will need.  List subject to update
import os, sys, stat, time, textwrap

## Clear screen function
def cls():
    if os.name == "nt":
        os.system("cls")
    else:
        os.system("clear")

cls()

print "-----------------------------------------------------------------------------------"
print " "
print "                      StrAuto Python Script (v. 0.3.1)"
print "                               "
print " "
print "                             Vikram E. Chhatre"
print "                         Genetics Graduate Program"
print "                 Dept. of Ecosystem Science & Management"
print "              Texas A&M University, College Station, TX 77843"
print "        Email: crypticlineage (at) gmail.com  www.crypticlineage.net."
print " "
print "-----------------------------------------------------------------------------------"
print " "
note1 = "This script will help automate your STRUCTURE analysis.  The script is free to use, distribute and modify, as long as this message and the headers in all files are maintained.  The author makes no expressed or implied warranties about the functionality provided herein.  You're strongly encouraged to review the documentation prior to using this script."
print "                                -: Notice :-           "
print " "
print textwrap.fill(note1, 80)
print " "
print "-----------------------------------------------------------------------------------"
print " "
print "            We will now import your data information from 'input.py'."
print "             Please make sure this file is in the current directory."
print " "
raw_input("                        Press ENTER to begin...")
print "\n"*200

## Function kfolders to print correct number of folders in the shell script.
def kfoldersf():
  mystr = ''.join("mkdir k{}\n".format(x) for x in xrange(1, maxpops+1))
  return mystr

## Function to print names of folders to be moved around through shell script.
def mvfolders():
  mvfold = ''.join("k{} ".format(y) for y in xrange(1, maxpops+1))
  return mvfold 

## Clear screen
cls()
print "\n\nReading analysis information from input file!  Please wait..."

## Import all the variables from the input.py file
from input import *

time.sleep(2)
cls()


## Show all the input info to confirm
print "----------------------------------------------------------------------"
print "Finished entering data for '%s'.  Verify your information.".rjust(60) %dataset
print "----------------------------------------------------------------------"
print "Maximum number of assumed populations :  ".rjust(55), maxpops
print "Number of burnin :  ".rjust(55),  burnin
print "Number of MCMC reps :  ".rjust(55),  mcmc
print "Name of dataset :  ".rjust(55),  dataset
print "Number of runs per K :  ".rjust(55),  kruns
print "Number of individuals :  ".rjust(55),  numind
print "Number of loci :  ".rjust(55),  numloci
print "Ploidy level :  ".rjust(55),  ploidy
print "Missing data is coded as :  ".rjust(55),  missing
print "Data for every individuals on line(s) :  ".rjust(55),  onerowperind
print "Data file contains individual labels? :  ".rjust(55), label
print "Does data file contain population identifiers? :  ".rjust(55),  popdata
print "Popflag is set to :  ".rjust(55),  popflag
print "Location data is set to :  ".rjust(55),  locdata
print "Does data file contain phenotypes? :  ".rjust(55),  pheno
print "Does data file have any extra columns? :  ".rjust(55),  extracols
print "Does data file contain a row with marker names? :  ".rjust(55),  markers
print "Are you using dominant markers? :  ".rjust(55),  dominant
print "Does data file contain map distances? :  ".rjust(55), mapdist
print "Is the data in correct phase? :  ".rjust(55),  phase
print "Does data file contain phase information line? :  ".rjust(55),  phaseinfo
print "Does phase follow Markov chain? :  ".rjust(55),  markov
print "----------------------------------------------------------------------"

print "                  (a)ccept to start writing output files."
print "                     (q)uit if you find errors above."
print "            Then correct the input file and rerun this script"
print " "
proceed = raw_input(">> ")

## If everything correct, begin writing output files.
if proceed.lower() == "a":
  print "Preparing to write..."
  time.sleep(1)

elif proceed.lower() == 'q':
  print "\nQuitting! Make corrections to input.py\n"
  print "Then please re-run the program.\n\n"
  exit(0)

else:
    exit(0)

## Clear the screen
cls()

###
### Now working on the 'mainparams' file
###
print " "
print "Now writing 'mainparams' file for %s!" % dataset
time.sleep(2)

## Opening the file named mainparams
target = open("mainparams", 'w')

## Writing to mainparams
### First the basic parameters
target.write("Basic program parameters\n")
target.write("#define MAXPOPS \t %d\n" % maxpops)
target.write("#define BURNIN  \t %d\n" % burnin)
target.write("#define NUMREPS \t %d\n\n" % mcmc)

### Input file info
target.write("Input file\n")
target.write("#define INFILE \t %s" % dataset +".str\n\n")

### Data information
target.write("Data file format\n")
target.write("#define NUMINDS \t %d\n" % numind)
target.write("#define NUMLOCI \t %d\n" % numloci)
target.write("#define PLOIDY  \t %d\n" % ploidy)
target.write("#define MISSING \t %s\n" % missing)
target.write("#define ONEROWPERIND \t %d\n\n" % onerowperind)
target.write("#define LABEL   \t %d\n" % label)
target.write("#define POPDATA \t %d\n" % popdata)
target.write("#define POPFLAG \t %d\n" % popflag)
target.write("#define LOCDATA \t %d\n" % locdata)
target.write("#define PHENOTYPE \t %d\n" % pheno)
target.write("#define EXTRACOLS \t %d\n" % extracols)
target.write("#define MARKERNAMES \t %d\n" % markers)
target.write("#define RECESSIVEALLELES \t %d\n" % dominant)
target.write("#define MAPDISTANCES \t %d\n\n" % mapdist)

target.write("Advanced data file options\n")
target.write("#define PHASED    \t %d\n" % phase) 
target.write("#define MARKOVPHASE \t %d\n" % markov)
target.write("#define NOTAMBIGUOUS \t -999 \n\n")

## Close the file 'mainparams'
target.close()

print "Done!"
time.sleep(1)
### Done with 'mainparams'

### Now working with the 'runstructure' shell script
## Create runstructure script and call it 'runstr'
runstr = open("runstructure", 'w')

print "Now writing 'runstructure' script!"
time.sleep(1)

## Print info about the script
runstr.write("#!/bin/sh \n")
runstr.write("#------------------------------------------------------------------------------\n")
runstr.write("# This is 'runstructure' script by Vikram Chhatre at Texas A&M University     \n")
runstr.write("#                  Email: crypticlineage (at) tamu.edu                        \n")
runstr.write("#------------------------------------------------------------------------------\n")
runstr.write("# This script was custom designed with 'StrAuto-0.3.0.py' python program.  This \n")
runstr.write("# means it will only work for the current data file.  Do not distribute this    \n")
runstr.write("# file; it won't work for others.  Please forward the StrAuto program instead.  \n")
runstr.write("#------------------------------------------------------------0-----------------\n\n")

## Create directory structure
runstr.write("mkdir results_f log harvester\n") 
runstr.write(kfoldersf())
runstr.write("\n")
runstr.write("cd log\n")
runstr.write(kfoldersf())
runstr.write("\n")
runstr.write("cd ..\n\n")

## For loop to iteratively write for all K's and all runs for each K
for myK in xrange(1, maxpops+1):
      for run in xrange(1, kruns+1):
	runstr.write("./structure -K %d -m mainparams -o k%d/%s_k%d_run%d 2>&1 | tee log/k%d/%s_k%d_run%d.log" % (myK, myK, dataset, myK, run, myK, dataset, myK, run))
        runstr.write("\n")

## This code is used to move files/folders around after STRUCTURE analysis finishes
runstr.write("mv %s results_f/\n" %mvfolders())
runstr.write("cd results_f/\n")
runstr.write("cp k*/*_f . && zip %s_Harvester-Upload.zip *_f && rm *_f\n" %dataset)
runstr.write("mv %s_Harvester-Upload.zip ../harvester/\n" %dataset)
runstr.write("cd ..\n")
runstr.write("echo 'Your structure run has finished.'\n")
runstr.write("echo 'Zip archive: %s_Harvester-Upload.zip is ready.'\n" %dataset)

## Close 'runstructure' script and assign rwx permissions to it                
runstr.close()
os.chmod("runstructure", 0755)


print "Assigning permissions to the 'runstructure' shell script"
time.sleep(2)

print "Done!"
time.sleep(1)

print " "
print "-----------------------------------------------------------------------------------------------"
print "Current directory contains: 'mainparams'(the parameter file) and 'runstructure' shell script.  "
print "Now place the structure commandline binary, the inputfile and 'extraparams' in this directory. "
print "Then execute the 'runstructure' script by doing './runstructure' or 'sh runstructure'.         "
print "-----------------------------------------------------------------------------------------------"
print " "
time.sleep(2)
print "\nEnd of program!\n\n"
exit(0)

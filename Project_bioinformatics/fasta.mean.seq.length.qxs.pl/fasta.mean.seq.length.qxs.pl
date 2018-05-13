#!/usr/bin/perl

# calculate.fasta.file. mean length
use strict;

my($n, $length) = (0, 0);
while(<>) {
       chomp;
       if(/^>/){
           $n++;
       }else {
           $length += length $_;
       }
   }

  print "Total seq number is $n\n";
  print "mean seq length of input file is:\n";
  print $length/$n;
  print "\n";

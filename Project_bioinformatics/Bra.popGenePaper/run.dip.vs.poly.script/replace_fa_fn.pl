#!/usr/bin/perl
use strict;
use warnings;


#prepare ortholog files or LRTtest
#run this script within the orthMCL main folder
system("mkdir out");

my @array = glob ("*.f*");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";

open FL, "<$file";
open OUT, ">out/$file";

my $qxs="";
my $qxs2="";
my $qxs3="";
my $qxs4="";

while (<FL>)
{ 
$qxs=$_;
$qxs=~ s/\>(\w{3})\s/\>$1\t$1/g;

$qxs2=$qxs;


$qxs3=$qxs2;


$qxs4=$qxs3;


print OUT "$qxs4";
}


close FL;
close OUT;
















}
print "Finished\n";



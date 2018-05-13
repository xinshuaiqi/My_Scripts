#!/usr/bin/perl
use strict;
use warnings;


#prepare ortholog files or LRTtest
#run this script within the orthMCL main folder

my @array = glob ("OrthGrps_1.5.txt");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";

open FL, "<$file";
open OUT, ">orthologs";

my $qxs="";
my $qxs2="";
my $qxs3="";
my $qxs4="";
my $qxs5="";


while (<FL>)
{ 
$qxs=$_;
$qxs=~ s/ORG\_(\d+)\:\s//g;

$qxs2=$qxs;
$qxs2=~ s/(\w{3})\|(\w{3})/$1/g;
#$qxs2=~ s/(\w{3})\|/$1/g;

$qxs3=$qxs2;
$qxs3=~ s/\n/\n\n/g;

$qxs4=$qxs3;
$qxs4=~ s/\s/\=/g;

$qxs5=$qxs4;
$qxs5=~ s/\=\=/\=\n/g;
print $qxs5;

print OUT "$qxs5";
}


close FL;
close OUT;
















}
print "Finished\n";



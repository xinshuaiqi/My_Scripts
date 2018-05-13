#!/usr/bin/perl
use strict;
use warnings;


#prepare ortholog files or LRTtest
#run this script within the orthMCL main folder
system("mkdir paml");

#fa
my @array = glob ("*.fasta");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";

open FL, "<$file";
open OUT, ">paml/$file";

my $qxs="";
my $qxs2="";
my $qxs3="";
my $qxs4="";

while (<FL>)
{ 
$qxs=$_;
$qxs=~ s/>(\w{3})\s(\w{3})/>$1/g;
#$qxs=~ s/>(\w{3})\s(\d+)/>$1$2/g;

$qxs2=$qxs;
$qxs2=~ s/\s/\n/g;

$qxs3=$qxs2;
$qxs3=~ s/\*//g;

$qxs4=$qxs3;


print OUT "$qxs4";
}

close FL;
close OUT;

}
system ("cp orthologs paml/");
print "Finished\n";



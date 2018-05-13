#!/usr/bin/perl
use strict;
use warnings;


#prepare ortholog files or LRTtest
#run this script within the orthMCL main folder

system("cp mclOutputRuns/ClusterSummaries/OrthGrps_1.5.txt Final/");
system("cd Final/");
my @array = glob ("OrthGrps_1.5.txt");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";

open FL, "<$file";
open OUT, ">orthologs";

my $seq="";

while (<FL>)
{ 
$seq=$_;
$seq=~ s/ORG\_(\d+)\:\s//g;

$seq2=$seq;
$seq2=~ s/\s/=/g;

$seq3=$seq2;
$seq3=~ s/\|//g;

print OUT "$seq3";
}


close FL;
close OUT;
















}
print "Finished\n";



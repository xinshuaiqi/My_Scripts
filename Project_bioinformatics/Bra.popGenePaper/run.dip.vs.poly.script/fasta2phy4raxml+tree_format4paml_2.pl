#!/usr/bin/perl
use strict;
use warnings;
#++++++++++++++++++++++++
###updated in 2015 2 17
#++++++++++++++++++++++++
#edit tree file for paml analysis
#print "please tell me how many species in this analysis, like 3, 4 or n\n";

#this part will edit the tree result




system("mkdir Tree4paml");
my @array2 = glob ("RAxML_bestTree.*.fasta");    #glob this kind of files in the current folder

foreach my $file(@array2)
{
print "$file\n";

open FL, "<$file";
open OUT, ">Tree4paml/$file";

my $seq="";
my $seq2="";
my $seq3="";
my $tree="";
my $number="";



while (<FL>)
{
 
#remove all the branch length information
$seq=$_;
$seq=~ s/\:\d+\.\d+//g;

$seq2=$seq;
#here is the short name of all the polyploid
#add #1 sign after their name in the tree file
$seq2=~ s/(bna|ipb|gma|gso|ghi|gba|nta|nbe|stu|hci|htu|cma|fxa|tae|mpa|mac|pxc|pni|ees|msi|pce|bha|bhb|bhc|Hua)(\d+)/$1$2\#1/g;

$seq3=$seq2;      ###
$seq3=~ s/(\w{3})(\d{7})(\d+)/$1$2/g;      ###

#count the seq number in the tree txt
my $number = $seq3 =~ tr/,/,/; 
my $number = $number +1;

print OUT "$number  1\n\n";   ############
print OUT "$seq3";



}
}


print "Finished\n";



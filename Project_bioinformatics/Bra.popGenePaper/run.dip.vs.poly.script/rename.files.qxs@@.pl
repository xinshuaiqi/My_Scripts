#!/usr/bin/perl -w

use strict;
use Storable;

#this script will rename all files within a folder,
#first read the file name, then replace it with regular express
#save it in a new name



print "Now start!\n\n";

system ("mkdir NewName");
my $qxs="";
my $file="";


my @array = glob ("*.fasta");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";
$qxs=$file;
$qxs=~ s/goodTEST\_//g;  ####################here tpye in the match pattern
system ("mv $file NewName/$qxs");
}













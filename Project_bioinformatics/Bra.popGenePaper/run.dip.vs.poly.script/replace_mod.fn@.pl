#!/usr/bin/perl
use strict;
use warnings;


#open a group of files, then edit them
#this is a mode
system("mkdir out");
my @array = glob ("mod.all.*.temp1");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";

open FL, "<$file";
open OUT, ">out/mod.all.fn";

my $seq="";

while (<FL>)
{ 
$seq=$_;
$seq=~ s/\>(\w{3})\s/\>$1|/g;

print OUT "$seq";
}


close FL;
close OUT;
















}
print "Finished\n";



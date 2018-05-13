#!/usr/bin/perl -w

use strict;
use Storable;

#this script will run translatorX loop for all the fasta files within the folder "$genus"
#to run, go into the genus folder with fasta seqs, type:
# perl qxs_guidance_loop.pl


system ("mkdir TEMP");
system ("mkdir aln");

print "Now start!\n\n";


my $qxs="";
my $file="";
my $file2="";
my $sss="";

my @array = glob ("*.fasta");    #glob this kind of files in the current folder
foreach my $file(@array)
{
$sss=$file;
#my $sss=<>;

print "$file\n";
system ("translatorx_vLocal.pl -i $file -o $file.out -p M -t F -w 1 -c 1");

system ("cp $file.out.nt_ali.fasta aln/$file");
system ("mv *.fasta.out.* TEMP/");
}




print "Finished\n";

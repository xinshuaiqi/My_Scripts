#!/usr/bin/perl
use strict;
use warnings;
#++++++++++++++++++++++++
###updated in 2015 2 17
#++++++++++++++++++++++++
#edit tree file for paml analysis
#print "please tell me how many species in this analysis, like 3, 4 or n\n";
my $outname = "$ARGV[0]";
chomp $outname;
print "$outname\n";



#open a group of files, then edit them
#this is a mode
#system("mkdir out");
my @array = glob ("*.fasta");    #glob this kind of files in the current folder
foreach my $file(@array)
{
print "$file\n";
system ("convertFasta2Phylip.sh $file>$file.phy");

#############################################################
#this part will search the longest outgroup seq in the phy file, 
#########################################################

my @FL;
my @outgroup;
my $outgroup;
my $BESTseqlength;
my $seqname;
my $BESTseq;
my $seqlength;
#read each fasta file, in the dnaaln347.fasta

open (FL, "$file.phy") or die "line 31 not work!\n";
@FL = <FL>;
#print @FL;
@outgroup = grep /$outname/, @FL;   #############
#print @outgroup;

$BESTseqlength = 0;
foreach $outgroup (@outgroup)
{

#replace - in the seq to get the actual seq length 
$outgroup =~ s/\-//g;
#print $outgroup;
$seqlength = length $outgroup;
#print "$seqlength\n";

$seqname =$outgroup; 
$seqname =~ s/($outname\d+)\s.*/$1/g;
#print $seqname;           ############

	if  ($seqlength > $BESTseqlength)
	{
	 $BESTseq=$seqname;
	 $BESTseqlength=$seqlength;
	}
#$BESTseq = my $BESTseq;
}
print $BESTseq;

#########################################################

system ("raxmlHPC -m GTRGAMMA -s $file.phy -n $file -p 12345 -o $BESTseq");



}







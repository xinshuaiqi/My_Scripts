#!/usr/bin/perl -w
use strict;


#this script will generate the longest outgroup seq in a gene family and save it as "refer.fa" for later analysis

#this is the gene family name, like "protein_alignments1000.aln"
my $input = $ARGV[0];

my $outgroup =$ARGV[1];
#or
#my $outgroup =	$ARGV[1];

#############################################################
#this part will search the longest outgroup seq in the phy file, 
#########################################################

my @FL;
my @outgroup;

my $BESTseqlength;
my $seqname;
my $BESTseq;
my $seqlength;





open (FL, "$input");

open OUT, ">refer.fa";

@FL = <FL>;
@outgroup = grep /$outgroup/, @FL;
$BESTseqlength = 0;
foreach $outgroup (@outgroup)
{

#replace “-“ in the seq to get the actual seq length 
$outgroup =~ s/\-//g;
#print $outgroup;
$seqlength = length $outgroup;
#print "$seqlength\n";

$seqname =$outgroup; 
$seqname =~ s/($outgroup\d+)\s.*/$1/g;
#print $seqname;           ############

	if  ($seqlength > $BESTseqlength)
	{
	 $BESTseq=$seqname;
	 $BESTseqlength=$seqlength;
	}
#$BESTseq = my $BESTseq;
}
close FL;
#print $BESTseq;

#now search the @FL and print the bestseq
open (FL, "$input");
my @fasta;
my $junk;
my @seqs;
for ($junk = 0; $junk <1;  $junk++){
undef $/;
while (<FL>) {
			$_ =~ s/>/__>/g;
			@fasta = split /__/, $_;
			}
}
close FL;

@seqs = grep (/$BESTseq/, @fasta);	
print OUT @seqs;
close OUT;


##
print "Successfully generated refer.fa\n";



























# my $outseq;
# my $i = 0;

# print $#FL;
# print $FL[0];


# while my $i (0..$#FL)
# {
# #print "$i __ $_";
# #	my $j=$i+1;
	# if ($FL[$i] eq $BESTseq)
	# {
	# print $FL;
	# print $FL[$i+1];
	# #$outseq = $FL[j];
	# }
# #$i=$i+1;
# }
# close FL;


# foreach $outgroup (@FL)
# {
	# my $i = 0;
	# if ($outgroup eq $BESTseq)
	# {
	# print $i."\n\n";
	# $outseq = $outgroup[$i+1];
	# }
	# $i++;
# }
#print $BESTseq;
#print $outseq;

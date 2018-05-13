#!/usr/bin/perl -w
use strict;

# this script will read the two provean out put file
# protein_alignmentsXXX.aln.dip.provean.out
# protein_alignmentsXXX.aln.poly.provean.out

# do statistics, check how many deleterious mutation within each test group

# count 1, if poly has higher deleterious mutation % than dip,
# count 0, elsif

#put this count and the % information into the OUT file

#To run:
#  provean.stat.pl protein_alignments1120.aln.poly.provean.out protein_alignments1120.aln.dip.provean.out

my $poly =$ARGV[0];
my $dip =$ARGV[1];

for ($poly, $dip)
{
#print "$_\n";
my $temp = $_;

open FL, "$temp";# or die "Can not open $temp"; #open each file 
my @file = <FL>;
#print "@file";
my $file;

#open SSS, "sss"; #temp saving

my $dLoci=-13; #deleterious loci number 
#here I set it as -13, because the first 13 lines in the input file are info, no Score, while later, they will be considerred as "0" > -2.5
#therefore, we need to remove 13 from the $dLoci;
my $None_dLoci=0;

foreach $file(@file)
	{
	#print $file;
	$file =~ s/\:\t//g; #replace those \t in the title line, so that I will not including them later
	$file =~ s/\tSCORE//g;     #replace those unrelevant number for same reason
	my @line=split (/\t/, $file);
	#my $line;
	#print $line[1];
		if (($line[1]) > -2.5)
		{$dLoci++;
		#print "$temp $dLoci=$line[1]";
		}
		else 
		{$None_dLoci++;}
	}
	print "$dLoci\n";
	print "$None_dLoci\n";
	my $percentage= $dLoci/($dLoci+$None_dLoci);
	open OUT,">>temp";
	print "In $temp~$percentage~are deleterious loci\n";	
	my $i ="$temp~$percentage~";
	print "$i\n";
	$i =~ s/protein\_(alignments\d+)\.aln\.(\w+)\.provean\.out/$1$2$3/g;
	print "$i\n";
	chomp $i;
	print OUT "$i\n";
	close FL;
}





#do statistics for each gene family

open X, "temp";
open FINAL, ">>FINAL";


my @x=<X>;
#print "array x is @x\n\n\n";

my $x;
print "---- $x[0]\n";
print "---- $x[1]\n";
my $xx;
chomp $x[0];
chomp $x[1];
$xx=$x[0].$x[1];
#print "NWOWOWOWOWOWOWO".$xx;

my @xx = split /~/, "$xx";

#print "array xx is @xx\n";


#create the gene family name in short
my $name = $xx[0];
$name =~ s/protein_(alignments\d+).aln.poly.provean.out/$1/g;
#print $name;

print $xx[1];
print $xx[3];
if ($xx[1] > $xx[3])
{
print FINAL "$name\t$xx[1]\t$xx[3]\t1\n";
}
else 
{
print FINAL "$name\t$xx[1]\t$xx[3]\t0\n";
}
close FINAL;

system "rm temp";
exit;



#!/usr/bin/perl
use warnings;

#useage: extract.WGT.gene.qxs.pl <unique_seq_no....fna> <extracted_WGT_gene_pairwise_unique_pk.txt>
$useq = "$ARGV[0]";
$NUM = "$ARGV[1]";
#$NUM = "extracted_WGT_gene_pairwise_unique_pk.txt";

#remove previous output file
system ("rm WGT_gene.out");
print ("Don't forget dos2unix $NUM\n");
open NUM;
while (<NUM>) 
{
        chomp $_;
        $N = $_;
#	print "$N\n";
	#print ".";
	#print   "grep '>$N\$' $useq -A 1\n";
	#system ("grep '>$N\$' $useq -A 1");
	system ("grep '>$N\$' $useq -A 1 >> WGT_gene.out");
}

#!/usr/bin/perl

# Creates a single list of sequence names from the remove_reciprocal_dups.pl output. Also, cleans out header information that confuses my fasta file searcher.

$NAME = "$ARGV[0]";	
open NAME or die "No file $NAME";
open (OUTFILE, ">>list.$NAME");
while (<NAME>) {
	$_ =~ s/\|//g;
	$_ =~ s/\.//g;
	$_ =~ s/gi//g;
	$_ =~ s/gb\w+//g;
	@cols = split /=/, $_; 
	chomp @cols[1];
	print OUTFILE "@cols[0]\n";
	print OUTFILE "@cols[1]\n";
}
close NAME;

close OUTFILE; 

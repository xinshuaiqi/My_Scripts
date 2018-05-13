#!/usr/bin/perl


#this script was originally called list.pl in the "rate_correction_64" pipeline. However, there was an identical named script. Therefore added a 2 at end of name when transferred to bin in October 2014 by Brendan Larsen, doing a rotation in lab of Michael Barker

# Creates a single list of sequence names from the orthologs file 

$NAME = "$ARGV[0]";	
$num_taxa = $ARGV[1];
open NAME or die "No file $NAME";
open (OUTFILE, ">list.$NAME");
while (<NAME>) {
	chomp $_;
	@cols = split /=/, $_; 
	for ($i = 0; $i < $num_taxa; $i++){
		print OUTFILE "$cols[$i]\n";
	}
}
close NAME;

close OUTFILE; 

#!/usr/bin/perl

# Removes reciprocal duplicates

$NAME = "$ARGV[0]";	
open NAME or die "No file $NAME";
@unique = ();
%seen = ();
while (<NAME>) {
	@cols2 = split /=/, $_; 
	chomp @cols2[1];
	$invhit = "@cols2[1]=@cols2[0]\n";
	$seen{$invhit} = 1;
	push (@unique, $_) unless $seen{$_}; 
}
close NAME;
open (OUTFILE, ">no_recip_dups.$NAME");
print OUTFILE @unique;
close OUTFILE; 

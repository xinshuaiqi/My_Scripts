#!/usr/bin/perl

#Removes inline duplicates.
$NAME = "$ARGV[0]";	
open NAME or die "No file $NAME";
@unique = ();
%seen = ();
while (<NAME>) {
		$hit = $_; 
		
		push (@unique, $_) unless $seen{$hit}++; 
			
		}
	close NAME;
	open (OUTFILE, ">no_dups.$NAME");
	print OUTFILE @unique;
	close OUTFILE; 

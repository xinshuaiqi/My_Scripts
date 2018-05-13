#!/usr/bin/perl

#This script searches through a file and removes rows that contain any of the phrases below - this script is used to remove sequences that are TEs.
$NAME = "$ARGV[0]";
open NAME or die "Cant' find file $NAME";
	@unique = ();
	while (<NAME>){
	
		push(@unique,$_) unless (/transposon/i or /retroelement/i or /Ty1/i or /Ty3/i or /copia/i or /gypsy/i or /transposable/i or /retrotransposon/i or /LINEs/ or /SINEs/ or /Helitrons/i or /MuDR/i or /Mariner/i);
	}
	close NAME;
	open (OUTFILE, ">no_te$column.$NAME");
	print OUTFILE @unique;
	close OUTFILE;;


exit;


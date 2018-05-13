#!/usr/bin/perl

$NAME = "$ARGV[0]";
open NAME or die "Cant' find file $NAME";
@ids = ();
open OUTFILE, ">dna_names";
print OUTFILE " \n";
while (<NAME>) {
	@ids = split /=/, $_;
	print OUTFILE ">", $ids[0],"\n";

}

close OUTFILE;

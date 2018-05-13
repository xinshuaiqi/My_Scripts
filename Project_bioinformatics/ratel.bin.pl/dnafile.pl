#!/usr/bin/perl

$NAME = $ARGV[0];
#$PROT = $ARGV[1];
open NAME or die "No file $NAME";
@dna1 = ();
@dna2 = ();

while (<NAME>) {
	chomp $_;
	@cols = split /=/, $_;
	push @dna1, $cols[0];
	push @dna2, $cols[1];
}



open OUTFILE, ">DNA1";
foreach (@dna1){
	print OUTFILE "$_\n";
}
close OUTFILE;

open OUTFILE, ">DNA2";
foreach (@dna2){
	print OUTFILE "$_\n";
}
close OUTFILE;

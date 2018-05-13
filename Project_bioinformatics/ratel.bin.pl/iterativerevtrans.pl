#!/usr/bin/perl

	
$DNA1 = "$ARGV[0]"; 
$DNA2 = "$ARGV[1]";
$FASTA = "$ARGV[2]";

@dna1list = ();
@dna2list = ();
@fasta = ();
@dna1fasta = ();
@dna2fasta = ();

open DNA1 or die "No file $DNA1";
open DNA2 or die "No file $DNA2";



while (<DNA1>){
	$_ =~ s/\|//g;

	push (@dna1list, $_);
}
close DNA1;


while (<DNA2>){
	$_ =~ s/\|//g;

	push (@dna2list, $_);
}
close DNA2;


open FASTA or die "No file $FASTA";

for ($junk = 0; $junk <1;  $junk++){

undef $/;

while (<FASTA>) {
	$_ =~ s/>/__>/g;
	$_ =~ s/\|//g;
	@fasta = split /__/, $_;
}
}
close FASTA;



for ($i=0; $i < scalar @dna1list; $i++){
	@dna1fasta = grep (/>$dna1list[$i]/, @fasta);
	@dna2fasta = grep (/>$dna2list[$i]/, @fasta);		
	open OUTFILE, ">dnapair.fasta";
	print OUTFILE @dna1fasta;
	print OUTFILE @dna2fasta;
	close OUTFILE;
	system ("python revtrans.py dnapair.fasta protein_alignments$i.aln -Idna fasta -Ipep fasta -match trans -allinternal > dnaaln$i.fasta");
}

open OUTFILE, ">dnapairnumber";
print OUTFILE scalar @dna1list;
close OUTFILE;

	






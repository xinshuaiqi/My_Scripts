#!/usr/bin/perl

	
$PROT1 = "$ARGV[0]";
$PROT2 = "$ARGV[1]";
$FASTA = "$ARGV[2]";

@prot1list = ();
@prot2list = ();
@fasta = ();
@prot1fasta = ();
@prot2fasta = ();

open PROT1 or die "No file $PROT1";
open PROT2 or die "No file $PROT2";



while (<PROT1>){

	push (@prot1list, $_);
}
close PROT1;


while (<PROT2>){
	
	push (@prot2list, $_);
}
close PROT2;


open FASTA or die "No file $FASTA";

for ($junk = 0; $junk <1;  $junk++){

undef $/;

while (<FASTA>) {
	$_ =~ s/>/__>/g;
	@fasta = split /__/, $_;
}
}
close FASTA;



for ($i=0; $i < scalar @prot1list; $i++){
	@prot1fasta = grep (/>$prot1list[$i]/, @fasta);
	@prot2fasta = grep (/>$prot2list[$i]/, @fasta);		
	open OUTFILE, ">proteins.fasta";
	print OUTFILE @prot1fasta;
	print OUTFILE @prot2fasta;
	close OUTFILE;
	system ("muscle -in proteins.fasta -out protein_alignments$i.aln");
}


	






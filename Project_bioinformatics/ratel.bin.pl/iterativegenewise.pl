#!/usr/bin/perl
	
$PROTS = "$ARGV[0]";
$NUCS = "$ARGV[1]";
$ENV{"WISECONFIGDIR"} = "/bin/wisecfg/";

@nucfasta = ();
@protfasta = ();

open NUCS or die "No file $NUCS";
open PROTS or die "No file $PROTS";


undef $/;


while (<PROTS>) {
	$_ =~ s/>/__>/g;
	@protfasta = split /__/, $_;
}

while (<NUCS>) {
	$_ =~ s/>/__>/g;
	@nucfasta = split /__/, $_;
}

close NUCS;
close PROTS;
$count=0;
foreach $protseq (@protfasta) {
	open OUTFILE, ">protseq";
	print OUTFILE $protseq;
	close OUTFILE;
	$nucseq = shift @nucfasta;
	open OUTFILE, ">nucseq";
	print OUTFILE $nucseq;
	close OUTFILE;
	
	system ("/bin/genewise protseq nucseq  -both -cdna -trans -pep -pretty -gener  -alg 333 -silent > genewiseout");
	system ("perl estcontig.pl < genewiseout > dirtycontig");
	system ("perl stopout.pl < dirtycontig > nostopcontig");
	system ("perl xout.pl dna_names $count < nostopcontig >> genewise_dnas.fasta");
	system ("perl xoutprots.pl dna_names $count < nostopcontig >> genewise_prots.fasta");
	$count++;
}


			






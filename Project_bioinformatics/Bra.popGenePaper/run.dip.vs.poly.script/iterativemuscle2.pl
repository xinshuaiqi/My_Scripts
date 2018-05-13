#!/usr/bin/perl

$NAMES = "$ARGV[0]";
$FASTA = "$ARGV[1]";

@namelist = ();
@fasta = ();


open NAMES or die "No file $NAMES";




while (<NAMES>){
	push @namelist, $_;
}
close NAMES;


open FASTA or die "No file $FASTA";

for ($junk = 0; $junk <1;  $junk++){

undef $/;

while (<FASTA>) {
	$_ =~ s/>/__>/g;
	@fasta = split /__/, $_;
}
}
close FASTA;



for ($i=0; $i < scalar @namelist; $i++){
	my @dnafasta = ();
	@cols = split /=/, $namelist[$i];
	open OUTFILE, ">proteins.fasta";
	foreach $name (@cols){
		@protfasta = grep (/^\>$name\n/, @fasta);  #qxs add ^
		print OUTFILE @protfasta;
	}
	close OUTFILE;
	
	system ("muscle -in proteins.fasta -out protein_alignments$i.aln");
}


	






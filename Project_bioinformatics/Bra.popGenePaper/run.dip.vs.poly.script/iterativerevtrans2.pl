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
	open OUTFILE, ">dna.fasta";
	foreach $name (@cols){
		@dnafasta = grep (/$name\n/, @fasta);
		print OUTFILE $dnafasta[0];
	}
	close OUTFILE;



	system ("revtrans.py dna.fasta protein_alignments$i.aln -Idna fasta -Ipep fasta -match trans -allinternal > dnaaln$i.fasta");
}

open OUTFILE, ">dnapairnumber";
print OUTFILE scalar @namelist;
close OUTFILE;

	






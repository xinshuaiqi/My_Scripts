#!/usr/bin/perl

#Takes a list of names and searches against a fasta file and produces a filtered fasta file containing only the sequences in the list.

$ID = "$ARGV[0]";	
$FASTA = "$ARGV[1]";
@ids = ();
@fasta = ();
@seqs = ();


open ID or die "No file $ID";		#READ ID into an array
while (<ID>){
	chomp $_;
	push (@ids, $_);
}
close ID;


#then do the fasta loop with undefine
#then a foreach loop with id array grep against @fasta


open FASTA or die "No file $FASTA";

for ($junk = 0; $junk <1;  $junk++){

undef $/;

while (<FASTA>) {
	$_ =~ s/>/__>/g;
	@fasta = split /__/, $_;
}
}
close FASTA;


foreach $seqid (@ids){
	@seqs = grep (/>$seqid\n/, @fasta);	
	open OUTFILE, ">>prot_fasta.$ID";
	print OUTFILE @seqs;
	close OUTFILE;
	
}






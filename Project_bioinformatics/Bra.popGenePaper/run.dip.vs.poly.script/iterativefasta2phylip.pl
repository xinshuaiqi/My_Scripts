#!/usr/bin/perl

$INFILE = "dnapairnumber";
open INFILE or die "no file $INFILE\n";
$count = 0;
while (<INFILE>) {
	chomp $_;
	$count = $_;
}
close INFILE;
for ($i=0; $i < $count; $i++){
	system ("/bin/seals/bin/fasta2phylipbarker <dnaaln$i.fasta> dnaaln$i.phy -output_style sequential -word 0");
}


	






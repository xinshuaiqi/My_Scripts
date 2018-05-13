#!/usr/bin/perl

$CONTROL = "/usr/bin/mastercodeml.ctl";
$INFILE = "dnapairnumber";
open INFILE or die "no file $INFILE\n";
$count = 0;
while (<INFILE>) {
	chomp $_;
	$count = $_;
}
close INFILE;

for ($i=0; $i < $count; $i++){
	open CONTROL or die "no control file $CONTROL\n";
	open OUTFILE, ">codeml.ctl";
	undef $/;
	while (<CONTROL>) {
		$_ =~ s/QQQQQQQ/dnaaln$i.phy/;
		print OUTFILE $_;
		}
	close OUTFILE;
		
	system ("codeml codeml.ctl");
	system ("cp 2ML.dN 2ML$i.dN");
	system ("cp 2ML.dS 2ML$i.dS");
	system ("cp pamlout pamlout$i");
}


	

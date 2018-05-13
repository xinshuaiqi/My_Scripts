#!/usr/bin/perl

$NAME = "$ARGV[0]";	

open NAME or die "No file $NAME";

print "clcleaner is running!!!!!!\n\n\n";

for ($junk = 0; $junk <1;  $junk++){

undef $/;

while (<NAME>) {
	$_ =~ s/>/__>/g;
	@fasta = split /__/, $_;
}
}
close NAME;

open (OUTFILE, ">no_cl.$NAME");
$count = -1;
foreach $seq (@fasta){
	$count ++;
	$seq =~ s/>.{0,1000}/>$count/;
	print OUTFILE $seq;
	
}

	close OUTFILE;

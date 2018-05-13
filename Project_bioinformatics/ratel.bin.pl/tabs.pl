#!/usr/bin/perl

$NAME = "$ARGV[0]";

open NAME or die "Can't find article $NAME: $!\n";


	open (OUTFILE, ">tab.$NAME");
	while (<NAME>){
		$_ =~ s/=/\t/g; 
		print OUTFILE $_; 
	}
	close NAME;
	close OUTFILE;
	print "Changed $sep to tab on $. lines in file $NAME\n";

exit;

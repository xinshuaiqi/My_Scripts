#!/usr/bin/perl

$NAME = "$ARGV[0]";	
open NAME or die "Cant' find file $NAME";
open (OUTFILE, ">clean.$NAME");
	while (<NAME>){
		$_ =~ s/ //g;
		$_ =~ s/\|//g;
		$_ =~ s/\.//g;
		$_ =~ s/gi//g;
		$_ =~ s/gb\w+//g;
		$_ =~ s/dbj\w+//g;
		$_ =~ s/emb\w+//g;
		$_ =~ s/pir\w+//g;
		$_ =~ s/ref\w+//g;
		$_ =~ s/sp\w+//g;
		$_ =~ s/pdb\w+//g;
		$_ =~ s/prf\w+//g;
		$_ =~ s/tpg\w+//g;
		$_ =~ s/tpe\w+//g;
		print OUTFILE $_; 
	}

	print "Cleaned up $. lines in file $NAME\n";

exit;

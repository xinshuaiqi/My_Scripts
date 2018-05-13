#!/usr/bin/perl

$column = 1;
$NAME = "$ARGV[0]";
open NAME or die "Cant' find file $NAME";
	@unique = ();
	%seen = ();
	while (<NAME>){
		@cols = split /=/, $_;
		$hit = @cols[$column];
		#push(@unique,$hit);
	open (OUTFILE, ">>prot_ids$column.$NAME");
	print OUTFILE "$hit\n";
	close OUTFILE;;
	}
	close NAME;
	


exit;


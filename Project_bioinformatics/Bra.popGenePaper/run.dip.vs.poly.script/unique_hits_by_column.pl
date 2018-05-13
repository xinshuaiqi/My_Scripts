#!/usr/bin/perl
$column = 0;
$NAME = "$ARGV[0]";
open NAME or die "Cant' find file $NAME";
	@unique = ();
	%seen = ();
	while (<NAME>){
		@cols = split /=/, $_;
		$hit = @cols[$column];
		push(@unique,$_) unless $seen{$hit}++;
	}
	close NAME;
	open (OUTFILE, ">unique_col$column.$NAME");
	print OUTFILE @unique;
	close OUTFILE;;


exit;


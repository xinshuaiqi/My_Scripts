#!/usr/bin/perl

$INFILE = "dnapairnumber";

my @values =();
my @query = ();
my @hit = ();
my @output1 = ();
my @final = ();
my $kaks = ();


open INFILE or die "no file $INFILE\n";
$count = 0;
while (<INFILE>) {
	chomp $_;
	$count = $_;
}
close INFILE;

open OUTFILE, ">pamloutput";
print OUTFILE "Query\tHit\tKa\tSE\tKs\tSE\tKa/Ks\tAth Annotation\tAnnotated EST\tProtein GI\tDescription\n";
for ($i=0; $i < $count; $i++){
	$INFILE2 = "pamlout$i";
	open INFILE2 or die "no file $INFILE2\n";

	@infile = ();
	while (<INFILE2>) {
		push @infile, $_;
		}
	@values = ();
	@query = ();
	@hit = ();
	@values = grep /method\s1/, @infile;
	@query = grep /\#1:/, @infile;
	@hit = grep /\#2:/, @infile;		
	chomp @query;
	chomp @hit;
	chomp @values;
	unless (@hit[0] eq ''){  
		push @output1, "@query[0]\t@hit[0]\t@values[0]";
			}
	close INFILE2;
}

$INFILE3 = "annotations";
	open INFILE3 or die "no file $INFILE3\n";
	while (<INFILE3>){
		push @infile3, $_;
		}
	close INFILE3;

$INFILE4 = "ath_annotations";
open INFILE4 or die "no file $INFILE4\n";
	while (<INFILE4>){
		push @infile4, $_;
			}
close INFILE4 ;

foreach $out (@output1) {	
	$out =~ s/\#1:\s+//g;
	$out =~ s/\s+\#2:\s+/\t/g;
	$out =~ s/\s+dN \=\s+/\t/g;
	$out =~ s/\s+dS \=\s+/\t/g;
	$out =~ s/\(by method 1\)//g;
	$out =~ s/\s+\+\-\s+/\t/g;
	$out =~ s/gi//g;
	$out =~ s/g//g;
	@final = split /\t/, $out;
	unless (@final[4] == 0) {
		$kaks = (@final[2]/@final[4]);
		}
	if (@final[4] == 0) {
		$kaks = NA;
		}
	
	@prots = grep /^@final[0]\t/, @infile3;
	@athhit = grep /^@final[0]\t/, @infile4;
	$uno = pop(@prots);
	$ath = pop(@athhit);
	my @goano = split /\t/, $ath;
	print OUTFILE "@final[0]\t@final[1]\t@final[2]\t@final[3]\t@final[4]\t@final[5]\t$kaks\t@goano[1]\t$uno";		
	

	}


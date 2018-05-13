#!/usr/bin/perl

my @query = ();
my @hits = ();
my @ks = ();
my @ka = ();
my @ka_se = ();
my @ks_se = ();
my @kaks = ();
my $count = 0;
my @remove = ();
my @keep = ();
$INFILE = "pamloutput";

open INFILE or die "No file $INFILE";


while (<INFILE>){
	chomp $_;
	@tabs = split /\t/, $_;
	push @query, $tabs[0];
	push @hits, $tabs[1];
	push @ka, $tabs[2];
	push @ka_se, $tabs[3];
	push @ks, $tabs[4];
	push @ks_se, $tabs[5];
	push @kaks, $tabs[6];
	$count++;
}
open OUTFILE, ">no_zero_ks";
for ($i=0; $i<$count; $i++){
	if (grep /$hits[$i]|$query[$i]/, @remove){
		next;
	}
	elsif ($ks[$i]==0.0000){
		push @remove, $hits[$i];
		print OUTFILE "x$query[$i]x\tx$hits[$i]x\t$ks[$i]\t$ks_se[$i]\n";
	}
	else {
		next;
	     }
}
for ($i=0; $i<$count; $i++){
	if (grep /$hits[$i]|$query[$i]/, @remove){
		next;
	}
	elsif ($ks[$i]==0.0000){
		next;
	}
	else {
		print OUTFILE "x$query[$i]x\tx$hits[$i]x\t$ks[$i]\t$ks_se[$i]\n";
	     }
}
close OUTFILE;

exit;

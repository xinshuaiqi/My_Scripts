#!/usr/bin/perl

# *********** min_fasta_length.pl ***************
# by KM Dlugosch ~ last edited July 2009
# script to pull sequences longer than a minimum value from a fasta file
# run: perl min_fasta_length.pl <fasta_filename> <min_length>
# ************************************************

use strict;
use warnings;

my $filename = "$ARGV[0]";
my $number = "$ARGV[1]";

my (@lines, @temp, @sequences, @headers);
open FILE, "<$filename";
while (<FILE>) {
	chomp $_;
	push @lines, $_;
}
close FILE;
push @lines, 'END';

for( my $i = 0 ; $i < scalar(@lines) -1 ; $i++ ) {
	if( ($lines[$i + 1] =~ />/) || ($lines[$i + 1] =~ /END/) ) {
		push @temp , $lines[$i];
		push @sequences , (join "", @temp);
		@temp = ();
	}
	elsif ($lines[$i] =~ />/) { push @headers, "$lines[$i]"; }
	else { push @temp , $lines[$i]; }
}
@lines = ();

if (scalar@headers != scalar@sequences) { die "\nError: Number of headers and number of sequences do not appear to match.\n\n"; }

open OUT, ">$filename.minlength$number";
for( my $i = 0 ; $i < scalar(@headers) ; $i++ ) { 
	if (length($sequences[$i]) > $number) { print OUT "$headers[$i]\n$sequences[$i]\n"; }
}
close OUT;


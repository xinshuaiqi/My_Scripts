#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
my $dir = getcwd;

################################3

my $grp_names = $ARGV[0];
my @groups;
open AFILE, "<$grp_names";
while (<AFILE>) {
	chomp $_;
	push @groups, $_;
}

close AFILE;
#print "The elements in 'groups' are @groups\n\n";

for (my $i=0; $i<@groups; $i++) {
	my $org_grp = $groups[$i];
	my @headers;
	open BFILE, "<$org_grp";
	
		while (<BFILE>) {
			chomp $_;
			push @headers, $_;
		}
		close BFILE;

#	#print "The sequences to match on are @headers\n\n\n";
#	#read in sequences
	my @fasta;
	$/ = ">"; #set record locator
	open FASTA, "<$ARGV[1]";
	#if( -e "$dir/$ARGV[1].fromlist") { die "\nError: File $ARGV[1].fromlist already exists.\n\n"; }
	
		while (<FASTA>) {
	        	chomp $_;
       			$_ =~ s/>//;
        		push @fasta, $_;
		}	
	
		close FASTA;

	#print "The sequences from the fasta file are @fasta\n\n";
	
	$/ = "\n"; #reset record locator

	@headers = sort @headers;
	@fasta = sort @fasta;
	
#	print "The new files in headers are sorted and @headers\n\n";
#	print "The new sorted files in fasta are @fasta\n\n";	
	my $prev_match = 0;
	my $lasthit;
	open OUT, ">$groups[$i]";
	for (my $i = 0; $i < @headers; $i++) {
   	    	my $ID = $headers[$i];
      		for (my $j = $prev_match; $j < @fasta; $j++) {
                	if ($fasta[$j] =~ m/$ID/ ) {
                        	print OUT ">$fasta[$j]";
                        	$lasthit = $j;
                        	last;
                }
        }
}
close OUT;
}

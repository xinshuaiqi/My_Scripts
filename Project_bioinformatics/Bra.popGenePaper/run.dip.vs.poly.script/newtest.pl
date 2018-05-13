#!/usr/bin/perl
use strict;
use warnings;
#####################this script sorts 
#####################the sequence IDs of each gene family alphabetically
#####################and gets taxa of interest orthologs see important
##################### regex line below

my $groups = $ARGV[0];
#my $outfile = $ARGV[1];
my $temp = $groups;
$temp =~ s/groups_//g;
$temp =~ s/.txt//g;
#print "$temp\n";
my @groups;
my @sorted;

open (AFILE, $groups) or die "cannot open $groups\n";;
while (my $line = <AFILE>) {
        chomp $line;     
	push @groups, $line;
}
#print @groups;
close AFILE;
#print "\n\nbefore @groups\n\n";

open OUT, ">sorted_$temp.txt";
for (my $i=0; $i<@groups; $i++) {
	my $gfam = $groups[$i];
	#print "$gfam\n";
	my @spl = split(/\s/, $gfam);
	#print "@spl\n";
	@sorted = sort @spl;
	print OUT "@sorted\n";		
}
close OUT;

my $gfile = "sorted_$temp.txt";
#my $outfile = $ARGV[1];
my @alltaxa;

open (AFILE, $gfile) or die "cannot open $gfile\n";
while (my $line = <AFILE>) {
        chomp $line;
        #this is the important regex line, adjust this for taxa
	if ($line =~ m/(^ORG_.+ipb.+ipn.+sly.+)/) {
                push (@alltaxa, $1."\n");
        }}
close AFILE;

open OUT, ">OrthGrps_$temp.txt";
print OUT @alltaxa;
close OUT;


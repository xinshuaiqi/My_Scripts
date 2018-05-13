#!/usr/bin/perl
use strict;
use warnings;

####the purpose of this script is to read in a file
####from orthoMCL and output files composed of:
#### 			a) the group name as the title
####			b) the corresponding sequences as lines in the file

###it requires an input file in a specific format

my @clusters;
my $clusterfile = $ARGV[0];
my $i;

open (AFILE, $clusterfile) or die "cannot open $clusterfile\n";

while (my $line = <AFILE>) {
	chomp $line;
	#$_ = $line;
	
	my @groupIDs = split(/:/, $line, 2); 
	
	#print "The first element of the groupID array is \n $groupIDs[0] \n\n";
	#print "The second element of the groupID array is \n $groupIDs[1] \n\n";
	
	my $name = $groupIDs[0];	
	#print "The output file name is going to be called $name\n\n";
	my $ghat = $groupIDs[1];
	
	my @headers = split (/ /, $ghat);
	open OUT, ">$name.txt" or die "cannot open outfile\n";
	for (my $i = 1; $i < @headers; $i++) {
		print OUT ">$headers[$i]\n";
	}
}
close AFILE;

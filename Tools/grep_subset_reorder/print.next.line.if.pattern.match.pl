#!/usr/bin/perl

#script for printing next line if pattern matched
#from Anthony

use strict;
use warnings;

my $infile = $ARGV[0];

print "#NEXUS\n\nbegin trees;\n";

open (AFILE, $infile) or die "Couldn't open file $infile: $!\n";
while (my $line = <AFILE> ) {
    chomp $line;
    if ($line =~ m/probability density/) {
        my $nextLine = <AFILE>;
        print "$nextLine\n";    
    }
}    
close AFILE;

print "end;\n";

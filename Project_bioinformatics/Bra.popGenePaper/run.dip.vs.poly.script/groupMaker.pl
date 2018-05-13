#!/usr/bin/perl
use strict;
use warnings;

my $infile = $ARGV[0];
my $num = $infile;
$num =~ s/mclOutput_//g;

system("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclMclToGroups ORG_ 1000 < $infile > groups_$num.txt");


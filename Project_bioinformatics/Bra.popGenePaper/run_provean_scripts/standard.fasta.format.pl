#!/usr/bin/perl -w
use strict;
my @files = glob ("*.aln");
foreach my $file(@files)
{
#/usr/bin/perl perl -p -i -e  's/\n//g' $file;
#/usr/bin/perl perl -p -i -e  's/(>\w{3}\d+)/\n$1\n/g' $file);

open IN, $file;
my@IN=<IN>;
close IN;

my $line;
open OUT, ">$file";
	foreach $line(@IN)
	{
	$line=~ s/\n//g; #remove all \n
		#for dip vs poly project
		#$line=~ s/(>\w{3}\d+)/\n$1\n/g;  #add \n in front and after the seq name line 

	# for brassica project
	$line=~ s/((>\d+\_\d+)|(>bra\d+))/\n$1\n/g;
	print OUT $line;
	}

#the first line is \n. remove it:
my $sed="sed -i '1d' $file";
#print $sed;
system("$sed");

close OUT;#3-10
}

exit;

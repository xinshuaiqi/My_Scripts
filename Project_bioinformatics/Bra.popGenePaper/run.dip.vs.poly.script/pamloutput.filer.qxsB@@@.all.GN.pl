#!/usr/bin/perl

#this script will filter out useless lines in the txt
#my $INFILE = $ARGV[0];
print "Please remember to edit this script each time!\n";
print "Then type ENTER\n";
$qxs=<>;

my $INFILE = "pamloutput.all.out";

#my @poly = ("stu");
#my @dip = ("spe","sly","sch");
#my @outgroup = ("mgu");

open INFILE,"<pamloutput.all.out";
open OUTFILE1, ">poly.vs.out";
open OUTFILE2, ">dip.vs.out";

while (<INFILE>) 
{
	chomp $_;
	$line = $_;

	#only keep those lines with the outgroup
	if ($line=~ m/\b*bsi*/)  # here match the line with this pattern, but whyI need to add \b ??
	{
		#print "$line\n";

		if ($line=~ /\b*bff*|\b*bfb*|\b*bfc*/) #poly
		{
		#print "$line";
		print OUTFILE1 "$line\n";
		}
		elsif ($line=~ /(\b*bha*|\b*bhn*|\b*bhc*)/)  #dip \b*asp*   \b*tmo*|\b*asp*/|b*ttu
		{
		print OUTFILE2 "$line\n";
		}
	}
}


close INFILE;
close OUTFILE1;
close OUTFILE2;

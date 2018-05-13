#!/usr/bin/perl -w
use strict;

my @sort = glob ("*.var.sort");
foreach my $sort(@sort)
{
	open FL, "$sort";
	open OUT, ">$sort.var";
	chomp(my @line=<FL>);
	my $line;
	my $i;
	for $i(0..$#line)
	{
	#print "$i\n";
	my $j=$i+1;
	#print "$line[$i] \= $line[$j]"."\n";
	if ($line[$i] eq $line[$j])
		{
		#do nothing
		}
	else 
		{
		$line[$i]=~ s/.*\_$//g; #rm lines end with _
		$line[$i]=~ s/^\-.*//g; #rm lines start with -
		$line[$i]=~ s/^\d.*//g; #rm lines start with \d
		$line[$i]=~ s/^\d+$//g;  #remove lines with only digital things
		$line[$i]=~ s/^\.*\_$//g;  #remove variation due to lack of information in the end of the seq, due to short seq
		$line[$i]=~ s/^delins.*//g;  #remove delins due to lack of information in the end of the seq, due to short seq
		$line[$i]=~ s/^\w1\_\w\d+del//g;  #remove del in the beginning of the seq, that is incomplete seq
		$line[$i]=~ s/.*\_\-.*//g;  #W738_-738insDHI this is due to:after ins, the next codon still not match
		$line[$i]=~ s/^\_.*//g; #__M1insMGL
		$line[$i]=~ s/.*insn.*//g; #insn
		$line[$i]=~ s/.*delins$//g;  #N1087delins
		$line[$i]=~ s/^ins.*//g;  #insVRLFD
		$line[$i]=~ s/.*\_delins.*//g;  #S295_delinsT:
		$line[$i]=~ s/.*\_\wdel//g;  #T261_Ldel:
		if ($line[$i] ne ""){print OUT "$line[$i]\n";}
		}

	}
	close FL;
	close OUT;

} 
print "\n\nXinshuai Qi\: Do not worry about \'Use of uninitialized value in string eq at.....' \n";
print "Finished var sort\n";
exit;



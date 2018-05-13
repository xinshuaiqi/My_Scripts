#!/usr/bin/perl

#this script needs to run within the "run_paml" folder

#it will read those pamlout files with a significant branch length difference, extract the Ka/Ks information

$INFILE = "all.GN";

open OUTFILE, ">pamloutput.all";

#here print the title line 
print OUTFILE "Genefamily\tQuery1\tQuery2\tKa\/Ks\tdN\tdS\t\n";



open INFILE or die "no file $INFILE\n";
foreach (<INFILE>) {
$i =$_;
chomp $i;
$INFILE2 = "pamlout$i";
my $qxs =$i;
open INFILE2 or print "no file $INFILE2\n";

print "$INFILE2@@@@\n";
#print OUTFILE "$INFILE2@@@@\n";
	@infile = ();
	while (<INFILE2>) {
		push @infile, $_;
		
		}
	@values = ();
	@query1 = ();
	@query2 = ();
	@hit = ();
#extract the line with "5 (ath1966113) ... 3 (bol5255)" in the pamlout file
# this line including the comparison pairs
#		(\d)\s\(\w{3}\d*\)\s\.\.\.\s(\d)\s\(\w{3}\d*\)
#first spp	(\d)\s\(\w{3}\d*\)\s\.\.\.\s
#second spp	\s\.\.\.\s(\d)\s\(\w{3}\d*\)


	@query1 = grep /(\d)\s\(\w{3}\d*\)\s\.\.\.\s/, @infile;
#this line the poly seq name
	
	@values = grep /t=/, @infile;		

	chomp @query1;
	
	#chomp @values;
	for ($i=0; $i <100000; $i++){
	$out = "@query1[$i]\t@values[$i]";
#replace and delete useless info	
	$out =~ s/t\=.*\/dS\=\s*//g;  #replace things from "t=", before dn/ds
	$out =~ s/\s+dN\=\s*/\t/g;
	$out =~ s/\s+dS\=\s*/\t/g;
	$out =~ s/(\d*)\s\((\w{3}\d*)\)\s\.\.\.\s(\d*)\s\((\w{3}\d*)\)/$2\t$4/g; 
	$out =~ s/(\t\t)//g;
	#test
	
	
	#print "$INFILE2$out";
	print OUTFILE "$INFILE2\t$out";
	}
			
	close INFILE2;
}


open OUTFILE;

while (<OUTFILE>) {
$out =~ s/pamlout\d+\t\tpamlout\d+\t\t//g;
print OUTFILE "$out";
}
close OUTFILE;

#print "please remember to replace sed 's/pamlout\d+\t\tpamlout\d+\t\t//g' pamloutput>pamloutput.out\n";
#print "please remember to replace sed 's///g' pamloutput>pamloutput.out\n";
#print "In sed, \\t is Just insert a literal tab instead '(press Ctrl-V then Tab)'\n";

#print "please also run this two lines:\n";
#print "sed '\$d' pamloutput > pamloutput2\n";
#print "mv pamloutput2 pamloutput\n";



#remove bad repeat region!!!!!!! See below annotation!!
$INFILE = "good.GN";

open INFILE, "<pamloutput.all";
open OUT, ">pamloutput.all.out";
while (<INFILE>) 
{
$i =$_;
#$i = "pamlout1024		pamlout1024		pamlout1024		pamlout1024		pamlout1024		pamlout1024		pamlout1024		pamlout1024		";
#print "$i\nqxs";
$i =~ s/pamlout\d+\t\t//g;
$i =~ s/pamlout//g;

#2015-2-21
$i =~ s/\d+\s\t\t//g;

print OUT "$i";
}


close INFILE;
close OUTFILE;

print "DONE!\n";

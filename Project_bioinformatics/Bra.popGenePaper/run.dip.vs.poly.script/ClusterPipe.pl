#!/usr/bin/perl
use strict;
use warnings;

my $listfile = $ARGV[0];
my @list;
my @outs;

open(AFILE, $listfile) or die "cannot open $listfile\n";
while (my $line =<AFILE>) {
	chomp $line;
	push @list, $line;
	#@outs = pop @list;
	#print @outs;
}
#print "@outs\n";
close AFILE;

#this makes the groups files
for (my $i=0; $i<@list; $i++) {
	my $mclOutFile = $list[$i];
	print "$mclOutFile:\tmaking groups\n";
	#system("groupMaker.pl $mclOutFile");
	system("groupMaker.pl $mclOutFile");	
	print "$mclOutFile:\tsummarizing\n";
	#system("");
}

print "\n\n\nnow sorting gene family IDs\nand parsing as specified\n";
#this sorts the gene family IDs
system("ls -1 groups*.txt > listgroups.txt");
my $groupfile = "listgroups.txt";
my @groups;
open(BFILE, $groupfile) or die "cannot open $groupfile\n";
while (my $line = <BFILE>) {
	chomp $line;
	push @groups, $line;
}
close BFILE;

for (my $j=0; $j<@groups; $j++) {
	my $groupFile = $groups[$j];
	print "$groupFile\n";
	system("newtest.pl $groupFile");
}

print "\n\n\nThe number of so called Orthologs per Inflation value has been calculated!\n\nHOORAY!!!!!!!!!\n\n\n";
mkdir "ClusterSummaries";
system("mv OrthGrps*.txt ClusterSummaries");
chdir('ClusterSummaries');
system("wc -l * > clusterSums.summary");

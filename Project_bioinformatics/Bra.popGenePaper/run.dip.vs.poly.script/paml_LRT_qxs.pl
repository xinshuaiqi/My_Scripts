#!/usr/bin/perl

#################
# Barker lab, University of Arizona
########################

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# this script will run paml and LRT test
# the idea was from Mike and brendon
# original script is: orthopipe_autoload_BIN_edit_tree.pl
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# the sub scripts used in this perl including: 
#Please make sure you already have them in bin_qxs and they are excutable
#  iterativemuscle2.pl
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#inputfiles:
	# the gene family fasta file, protein sequence
	# a list with all gene family names

# to start typein like this:
# paml_LRT_qxs.pl A_B_C 10
#

use warnings;
#$NAME = "$ARGV[0]";  ###这里需要改成A_B_C

$run_name= "$ARGV[0]"; #A_B_C  #这个运算的名字

$all_taxa=$run_name; # $all_taxa will be used in Mike's script
print "$all_taxa";

$CPU = "$ARGV[1]";

#open NAME or die "No file $NAME\n";
open NAME, "<input/orthologs.$all_taxa"; 

#check server load;
LOOP1: while (<NAME>) {
  chomp $_;
  #$row_of_names = $_;
  open PIPE, "uptime |";
  my $line = <PIPE>;
  close PIPE;
  $line =~ s/\s//g;
  my @lineArr =  split /:/, $line;
  my $times = $lineArr[@lineArr-1];
  my @timeArr = split /,/, $times;
  my $load = $timeArr[0] + $CPU;
  print $load," is the current load plus new CPU request\n\n";

  if($load < 48) 
{ 
#Now Start
print "Now start paml_LRT_qxs.pl\n";

# do protein-guided alignments
print "do protein-guided alignments\n";
system ("cd input; iterativemuscle2.pl orthologs.$all_taxa genewise_prots$all_taxa.fasta");
#system ("cd input; find . -mindepth 1 -maxdepth 1 -name \"*.aln\" -printf %f\\\\0 | xargs -0 cp -puRvf --target-directory=Orthopipe/Data");







}
else{
    sleep(10);
    redo LOOP1;
    }
}












































































































































	
	

#!/usr/bin/perl

#################
# Barker lab, University of Arizona
########################

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# this script will run paml and LRT test
# the idea was from Mike and brendon
# original script is: orthopipe_autoload_BIN_edit_tree.pl
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# to start typein like this:
# paml_LRT_A.pl 10
# perl paml_LRT_A.pl 10

# then type the species number as required by the perl script

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# the sub scripts used in this perl including: 
#Please make sure you already have them in bin_qxs and they are excutable
#  iterativemuscle2.pl
#  iterativerevtrans2.pl
#		revtrans.py		
#	iterativefasta2phylip.pl
#	iterativepaml.pl
#
#iterativepaml_br_0123_qxs.pl
#fasta2phy4raxml+tree_format4paml.pl
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
	# orthologs                   ##a list with all gene family names
	# genewise_prots.fasta         ##the gene family fasta file, protein sequence
	# genewise_dnas.fasta      ##the gene family fasta file, DNA sequence



use warnings;
	

$CPU = "$ARGV[0]";

#print "How many species in this analysis? please type 3,4 or other numbers below.\n";
#$number = <STDIN>;
#chomp $number;


#create all the folders
system ("mkdir result");


#open NAME or die "No file $NAME\n";
open NAME, "<orthologs"; 

#check server load;
#LOOP1: while (<NAME>) {
  #chomp $_;
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

#这一步Sate完成了
## do protein-guided alignments

print "do protein-guided alignments\n";
system ("iterativemuscle2.pl orthologs genewise_prots.fasta");

##get DNA sequence for protein alingments
##here you will use the "protein_alignments[i].aln" from previous step

print "get DNA sequence for protein alingments\n";
system ("iterativerevtrans2.pl orthologs genewise_dnas.fasta");  #这一步和Sate alignment 有什么区别？

system ("mkdir result/aln");       
system ("mkdir ./result/dnaaln/");
system ("mv dnaaln* ./result/dnaaln/");
system ("mv *.aln ./result/aln/");
system ("mv proteins.fasta ./result/");
system ("mv dna.fasta ./result/");

print "Test\n";
print "get DNA sequence for protein alingments\n";

#raxml # qxs
# format 

#below script will transfer fasta files in the folder to phy
#then run raxml for each phy file
# the result trees will re-formatted, and saved in the folder "Tree4paml"
system ("mkdir result/tree");
system ("cp result/dnaaln/* result/tree");

system ("cd result/tree/;fasta2phy4raxml+tree_format4paml.pl");

system ("");


#######system ("cp tree.tree result/tree_master_br");  ########@@@@@@@@$$$$$$$$############

#format for paml
print "\n\n\tRunning PAML\n\n";

system ("mkdir result/phy/");
system ("mv dnapairnumber ./result/dnaaln/");

system ("cd result/dnaaln; iterativefasta2phylip.pl");  #～～～～～～
system ("cd result/dnaaln; mv *.phy ../phy/");


print "Test\n";
print "\n\n\tRunning PAML\n\n";
#$qxs =<STDIN>;
 

}
else{
    sleep(10);
    redo loop1;
    }
#}
close NAME;











































































































































	
	

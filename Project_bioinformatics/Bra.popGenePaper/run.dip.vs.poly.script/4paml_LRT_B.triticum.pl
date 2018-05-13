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
# paml_LRT_qxs.pl 10
# perl paml_LRT_qxs.pl 10

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
	

print "Please make sure you have already changed the \@taxa info in this script! \n";
print "Then, type 'ENTER' to continue analysis! \n";
$qxs =<STDIN>;

$CPU = "$ARGV[0]";

#create all the folders
system ("mkdir run_paml");
system ("cp result/phy/* run_paml/");
system ("cp result/tree/Tree4paml/* run_paml/");


#open NAME or die "No file $NAME\n";
open NAME, "<orthologs"; 

#check server load;
#LOOP1: while (<NAME>) {
 # chomp $_;
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
print "Now start paml_LRT_B.pl\n";















#######system ("cp tree.tree result/tree_master_br");  ########@@@@@@@@$$$$$$$$############

#format for paml


#$qxs =<STDIN>;

# calculate ka and ks for each orthologous pair, using paml codeml

system ("cp result/dnaaln/dnapairnumber run_paml");

#on server: 
system ("cp /home/qixinshuai/bin/mastercodeml/mastercodeml.ctl run_paml");
system ("cd run_paml; iterativepaml.pl");

print "Test\n";
print "\n\n\t calculate ka and ks for each orthologous pair\n\n";
#$qxs =<STDIN>;

# make a list of all the ka, ks values, with names
system ("cd run_paml; find *.dS -print | xargs cat > ksvaluescodeml");
system ("cd run_paml; find *.dN -print | xargs cat > kavaluescodeml");
system ("mkdir run_paml/kaks/");
system ("cp run_paml/ksvaluescodeml run_paml/kaks/");
system ("cp run_paml/kavaluescodeml run_paml/kaks/");

#print "Test\n";
print "\n\n\t  make a list of all the ka, ks values \n\n";
#$qxs =<STDIN>;

#Do LRT
print "\n\n\tPreparing LRT\n\n";

system ("cp /home/qixinshuai/bin/mastercodeml/mastercodeml_lrt1.ctl run_paml");
system ("cp /home/qixinshuai/bin/mastercodeml/mastercodeml_br.ctl run_paml");
system ("cp /home/qixinshuai/bin/mastercodeml/mastercodeml_br2.ctl run_paml");
system ("cp /home/qixinshuai/bin/mastercodeml/mastercodeml_br3.ctl run_paml");
#system ("mv result/tree_master_br run_paml/");

#cp tree files to the phy folder
#system ("cp result/dnaaln/Tree4paml/* result/phy/");

#print "Test\n";
print "\n\n\tDoing LRT\n\n";
#$qxs =<STDIN>;


@taxa = ("asp","osa","tae","tmo","ttu");       ##
system ("cd run_paml; iterativepaml_br_0123_qxs.pl @taxa");  
system ("cp run_paml/lrt_br.txt ./");



 

}
else{
    sleep(10);
    redo loop1;
    }
#}
close NAME;











































































































































	
	

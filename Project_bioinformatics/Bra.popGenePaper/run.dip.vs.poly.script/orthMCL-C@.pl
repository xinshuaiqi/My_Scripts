#!/usr/bin/perl
use strict;
use warnings;

#this script is one of the three script to run orthMCL

#step C will parse,load blast results into mysql

#inputfile is "my_blastp_output.tsv"
#outputfile is ""

print "Remember to change newtest.pl before run this step C\n";
print " script edit-newtest.pl.qxs.pl can help you a little bit\n";
print "press ENTER to continue!\n";
my $qxs=<STDIN>;


#here the next 3 steps usually will take >5min to finish if your tsv file is big, please be patience.
	#parse blast results into similarSequences file	
system("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclBlastParser my_blastp_output.tsv compliantFasta >> similarSequences.txt");

	#load blast results into mysql
system("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclLoadBlast orthomcl.config similarSequences.txt");

	#find pairs
system("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclPairs orthomcl.config 111orthomcl_pairs.log cleanup=no");

	#dump pairs
system("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclDumpPairsFiles orthomcl.config");

system ("");

#system ("mkdir mclOutputRuns");
#system ("mcl mclInput --abc -I 1.5 -o mclOutputRuns/mclOutput_1.5");

#system ("cd mclOutputRuns/");
#system ("ls -1 mclOutput_* > mclOutputList.txt");
#system ("ClusterPipe.pl mclOutputList.txt");

#A) an unsorted "groups_#.txt" filels `
	#B) a sorted "sorted_#.txt" file
	#C) a sorted "OrthGrps_#.txt" that will have each taxa represented at least once according the adjusted "newtest.pl" regex
	#the summary file "clusterSums.summary" shows the number of OrthoGroups per Inflation value, one could perform 
	#When filtering out each taxa represent at least once, if there is more than 8 taxa, might need to take 2 steps.
	#Run to newtest.pl multiple times to filter.
	
	#a similar summary of all clusters with "wc -l mclOutput_* > rawclusterSums.summary"

#Drop database in mysql if you need space. 
	# mysql> DROP DATABASE brass;



#Get data ready for SATe (protein or $$$$$$$$$$   nucleotide).
	#right now the data should be in the format:
	#  ORG_####: taxonA|taxonA#x taxonB|taxonB#x ta:qxonC|taxonC#x taxonD|taxonD#x ...
	
	#to run SATe we need to have a fasta file for each gene family we can do this in a few steps:
	
	#make a file for each gene family with each ID on its own line	
	#	perl bobmarley.pl OrthGrps_#.#.txt
	
#system ("cd ClusterSummaries");
#system ("bobmarley.pl OrthGrps_1.5.txt");
#system ("cp ORG*.txt ../../");
#system ("cd ../..");

	
##############
#Here I need to move all the fna files into here
# then, 
#cat *.fna >all.fasta
##############

#put all fna files into one
#system ("cat *.fna >all.fasta");

# remove \n within the fasta seqs
#system ("awk '/^>/{print s? s"\n"$0:$0;s="";next}{s=s sprintf("%s",$0)}END{if(s)print s}' all.fasta>all2.fasta");

#move seq right after the seq name, like ">dna ATCGATT"
#system (awk 'ORS=NR%2?" ":"\n"' "all.fasta" > mod.all.fasta);

#prepare ORG file list
#system ("cd mclOutputRuns/ClusterSummaries/");
#system ("ls -1 ORG*txt > orglist.txt");

#perl marge.pl orglist.txt mod.all.fasta
#system ("cp orglist.txt ../../");
#system ("cd ../..");
#system ("marge.pl orglist.txt mod.all.fasta");

# done!
#output files are "ORG_1000.txt..." in the main folder
print "orthMCL-C.pl has finished!!!\n";


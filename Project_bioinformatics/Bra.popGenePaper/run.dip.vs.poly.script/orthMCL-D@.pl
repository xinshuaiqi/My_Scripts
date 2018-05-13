##########
#when you have changed the newtest.pl
#simply copy and paste the following command, run them
############
# this step only works in the mclOutputRuns folder 

#============================
#please make sure you have changed the "newtest.pl" 
#============================

mkdir mclOutputRuns
mcl mclInput --abc -I 1.5 -o mclOutputRuns/mclOutput_1.5

cd mclOutputRuns
ls -1 mclOutput_* > mclOutputList.txt
ClusterPipe.pl mclOutputList.txt       #here I need to change newtest.pl again!!!


#fn	
cd ClusterSummaries
bobmarley.pl OrthGrps_1.5.txt
cp ORG*.txt ../../
cd ../..

cat *.fn >all.fn
awk 'ORS=NR%2?" ":"\n"' "all.fn" > mod.all.fn

								#mod.fn里要把序列 >ath 1001 改成 >ath|1001 => only for qxs's data         #not needed any more
								#replace_mod.fn@.pl 
								#mv out/mod.all.fn ./

cd mclOutputRuns/ClusterSummaries/
ls -1 ORG*txt > orglist.txt

cp orglist.txt ../../
cd ../..

marge.pl orglist.txt mod.all.fn

mkdir Final
mkdir Final/fn
mv ORG_*.txt Final/fn/



#fa
cd mclOutputRuns/ClusterSummaries/
cp ORG*.txt ../../
cd ../..

									#mod.fa里要把序列 >ath 1001 改成 >ath|1001 => only for qxs's data     #not needed any more
									#replace_mod.fa@.pl 
									#mv out/mod.all.fa ./

cat *.fa >all.fa
awk 'ORS=NR%2?" ":"\n"' "all.fa" > mod.all.fa

marge.pl orglist.txt mod.all.fa
mkdir Final/fa
mv ORG_*.txt Final/fa/





#------------------------------------------------------------------------------
cat Final/fa/* > Final/genewise_prots.fasta
cat Final/fn/* > Final/genewise_dnas.fasta

mkdir LRTinput


cp mclOutputRuns/ClusterSummaries/OrthGrps_1.5.txt Final/


















































------------------------------------------------------
Below is elder notes, you can ignore them.
------------------------------------------------------
#!/usr/bin/perl
use strict;
use warnings;


#this is not a perl script
#=========================================================================================================
###simply copy and paste the following things in your shell, once you are in your project folder.
#=========================================================================================================

mkdir mclOutputRuns
mcl mclInput --abc -I 1.5 -o mclOutputRuns/mclOutput_1.5

cd mclOutputRuns
ls -1 mclOutput_* > mclOutputList.txt
ClusterPipe.pl mclOutputList.txt


system ("mkdir mclOutputRuns");
system ("mcl mclInput --abc -I 1.5 -o mclOutputRuns/mclOutput_1.5");

system ("cd mclOutputRuns/");
system ("ls -1 mclOutput_* > mclOutputList.txt");
system ("ClusterPipe.pl mclOutputList.txt");


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
	
cd ClusterSummaries
bobmarley.pl OrthGrps_1.5.txt
cp ORG*.txt ../../
cd ../..

system ("cd ClusterSummaries");
system ("bobmarley.pl OrthGrps_1.5.txt");

system ("cp ORG*.txt ../../");
system ("cd ../..");




##############
#Here I need to move all the fna files into here
# then, 
#cat *.fna >all.fasta
##############



#put all fna files into one # system ("cat *.fn >all.fasta");
cat *.fn >all.fasta

	# remove \n within the fasta seqs #不再需要了
	#awk '/^>/{print s? s"\n"$0:$0;s="";next}{s=s sprintf("%s",$0)}END{if(s)print s}' all.fasta>all2.fasta

#move seq right after the seq name, like ">dna ATCGATT"
awk 'ORS=NR%2?" ":"\n"' "all.fasta" > mod.all.fasta

#prepare ORG file list
cd mclOutputRuns/ClusterSummaries/
ls -1 ORG*txt > orglist.txt

###perl marge.pl orglist.txt mod.all.fasta
cp orglist.txt ../../
cd ../..
marge.pl orglist.txt mod.all.fasta   #here you need to make sure all the ORG files also in the same folder

mkdir Final
mv ORG_*.txt ./Final/
cd Final

#prepare for sate
#generate a seq.list file 
ls -1 >../seq.list




# done!
#output files are "ORG_1000.txt..." in the main folder

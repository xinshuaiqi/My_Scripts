##!/usr/bin/perl -w
#run this within the trimomatic folder
#make sure you prepared fastq.list

open L, "fastq.list"; #make sure you have this, example: DRR12232123 118_AGTTCC_L002

while (<L>) 
{
$fq=$_;
chomp $fq;

$fq_1=$fq."_1.fastq";
$fq_2=$fq."_2.fastq";
#$fq_1=$fq."_R1_001.fastq";
#$fq_2=$fq."_R2_001.fastq";
#print "$fq_1\n";

#$qxs=<>;



print "Now trimmomatic works on $fq...\n\n\n";

#run trimmomatic
#system ("java -jar /home/qixinshuai/bin/Trimmomatic-0.33/trimmomatic-0.33.jar PE -threads 4 -phred33 -trimlog $fq.log $fq_1 $fq_2 $fq.1P $fq.1U $fq.2P $fq.2U ILLUMINACLIP:./adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36");
 system ("java -jar /home/qixinshuai/bin/Trimmomatic-0.32/trimmomatic-0.32.jar PE -threads 16 -phred33 -trimlog $fq.log $fq_1 $fq_2 $fq.1P $fq.1U $fq.2P $fq.2U ILLUMINACLIP:/home/qixinshuai/bin/Trimmomatic-0.33/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36>$fq.out");

#calculate fastqc
system ("fastqc $fq.1P");
system ("fastqc $fq.2P");

}


print "FINISHED\n";


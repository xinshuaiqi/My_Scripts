###### SnoWhite & Soapdenovo-trans Assembly Pipeline (SSTAP) ######
######   	Author: Li,Zheng @ Barker lab    	     ######
######   	Version: 1.2.20.2015                         ######
###### This is a combination of SnoWhite & Soapdenovo-trans  ######
  

#To run
# XXX.pl xxx.list $CPU


#QXS 
#edit from lizheng's script
###install


#1 tar xzf SnoWhite.gz
#2 cp Illumina_adapter_seqs into SnoWhite folder
# chmod fastq-dump

#sudo apt-get install sra-toolkit #


#to run
# prepare list file
# SSTAP.qxs.pl LISTNAME CPU

$NAME = "$ARGV[0]"; #the file list
$CPU = "$ARGV[1]";  #CPU used in Snowhite, no more than 16
open NAME or die "No file $NAME\n";

print "\n###### SSTAP is launched ######\n";

while (<NAME>) {
        chomp $_;
        my @ID = split (/\t/, $_, 3);
	
	my $sample = $ID[0];
	#my $taxon = $ID[1];
	my $ave_ins = $ID[1];
	#my $kmer = int $ID[2]/3*2;
	my $kmer = 127;
	if (0 == $kmer % 2) {
    	 $kmer++;   # keep kmer to be an odd number;
} 
	
	print "\n My sample is $sample.\n ave_ins is $ave_ins.\n Kmer is $kmer.\n\n";	

##prepare for soapdenovotrans

system ("mkdir $sample");
system ("cp ./soapdenovo-trans_config.qxs ./$sample/soapdenovo-trans_config.$sample");

system ("sed -i 's/XXX/$ave_ins/g' ./$sample/soapdenovo-trans_config.$sample");
system ("sed -i 's/NNN/$sample/g' ./$sample/soapdenovo-trans_config.$sample");

#system ("mv $sample\_R1.clean $sample");
system ("mv $sample\_R1.clean $sample");
#system ("mv $sample\_R2.clean $sample");
system ("mv $sample\_R2.clean $sample");

####run soap denovo trans:
print "cd ./$sample; ../SOAPdenovo-Trans-127mer all -s soapdenovo-trans_config.$sample  -o $sample-$kmer -K $kmer -p $CPU\n\n";
sleep (5);
system ("cd ./$sample; ../SOAPdenovo-Trans-127mer all -s soapdenovo-trans_config.$sample  -o $sample-$kmer -K $kmer -p $CPU");

#system ("cd ./$taxon.assembly; mv *.scafSeq ./");
print "\n Finished $taxon assembly! \n";

}

print "\n\n###### ALL are Finished! ######\n\n";
 


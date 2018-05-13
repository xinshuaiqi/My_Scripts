###### loop tophat Pipeline (SSTAP) ######
######   	Author: Xinshuai Qi @ Barker lab    	     ######
######   	Version: .2015                         ######
######   ######
  

#To run
# loop.tophat.qxs.pl xxx.list $CPU

$NAME = "$ARGV[0]"; #the file list
$CPU = "$ARGV[1]";  #CPU used 
open NAME or die "No file $NAME\n";

print "\n######  launched ######\n";

while (<NAME>) {
        chomp $_;
        my @ID = split (/\t/, $_, 3);
	
	my $sample = $ID[0];
	my $length = $ID[1];
	my $mit=$length-500; #mate-inner-dist = insert size - 2 * read length
	if ($mit<0)
		{$mit=0} #this value should no less than 0

print "\n My sample is $sample .\n mate-inter-dist is $mit \n  required CPU is $CPU\n\n";	

####run soap denovo trans:
print   "./tophat bt2_base_Brapa_1.5  $sample\_R1.clean $sample\_R2.clean -o $sample\.out -p $CPU --mate-inner-dist $mit\n\n";
sleep (5);
#my $qxs = <STDIN>;

system ("./tophat bt2_base_Brapa_1.5  $sample\_R1.clean $sample\_R2.clean -o $sample\.out -p $CPU --mate-inner-dist $mit");
system ("mkdir $sample\.out");
system ("mv tophat_out $sample\.tophat_out")
system ("mv ./$sample\.tohat_out/ ..accepted_hits.bam");


print "\n Finished $sample tophat! \n";

}

print "\n\n###### ALL are Finished! ######\n\n";
 


###### loop tophat Pipeline (SSTAP) ######
######   	Author: Xinshuai Qi @ Barker lab    	     ######
######   	Version: .2015                         ######
######   ######
  

#To run
#create a folder, move all cleaned fq file to the folder, create a file.list with file name and insert size info, separated by \t
# then run this within the folder
# perl ../loop.tophat.qxs2.pl xxx.list $CPU
#  perl ../loop.tophat.qxs2.pl list.ALL48.a 24
$NAME = "$ARGV[0]"; #the file list
$CPU = "$ARGV[1]";  #CPU used 

open NAME or die "No file $NAME\n";


print "\n######  launched ######\n";

while (<NAME>) {
        chomp $_;
        my @ID = split (/\t/, $_, 3);
	
	my $sample = $ID[0];
	my $length = $ID[1];
	my $mit=$length-200; #mate-inner-dist = insert size - 2 * read length
	if ($mit<0)
		{$mit=0} #this value should no less than 0

print "\n My sample is $sample .\n mate-inter-dist is $mit \n  required CPU is $CPU\n\n";	

####run soap denovo trans:
print   "../tophat ../bt2_base_Brapa_1.5  $sample\_R1.clean $sample\_R2.clean -o $sample\.out -p $CPU --mate-inner-dist $mit\n\n";
sleep (5);
system ("../tophat ../bt2_base_Brapa_1.5 $sample\_R1.clean $sample\_R2.clean -o $sample\.out -p $CPU --mate-inner-dist $mit");

system ("mv tophat_out $sample\.tophat_out");
system ("mv ./$sample\.tophat_out/accepted_hits.bam ./$sample\.accepted_hits.bam");
system ("mv ./$sample\.tophat_out/junctions.bed ./$sample\.junctions.bed");
print "\n Finished $sample tophat! \n";

}

print "\n\n###### ALL are Finished! ######\n\n";
 


##!/usr/bin/perl -w
#run this within the snowhite folder on ratel
#make sure you prepared fastq.list

print "Make sure you have changed the file.list name in the script!\n\n";
$qxs=<>;

open L, "file.list4"; #make sure you have this
while (<L>) 
{
$fq=$_;
chomp $fq;

print "\n\nNow Snowhite works on $fq...\n\n\n";

#run snowhite
system ("perl snowhite_2.0.3.pl -f $fq -v Illumina_adapter_seqs -p 10 -Q 20 -D T -L T -g T -R T");

$fq=~ s/\.fastq//g;
#print "$fq\n";
#$qxs=<>;

system ("mv ./$fq/FinalOutput/*.clean ./");

$new = $fq;
$new =~ s/^(\d+).+(\_R\d)\_001/$1$2/g;
#print $new;
system ("mv $fq\.clean $new\.clean");

}


print "Now FINISHED\n";


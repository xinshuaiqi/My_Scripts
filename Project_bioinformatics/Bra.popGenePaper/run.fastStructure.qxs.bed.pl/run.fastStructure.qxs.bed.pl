#!/usr/bin/perl -w 
#run: perl run.fastStructure.qxs.bed.pl all56.bed  # although the files are all56.bed.XXX

chomp($file = "$ARGV[0]");
#print "\n\n$F\n\n";


#$file = chomp ($F);
print "\n\n$file\n\n";

#$qxs=<STDIN>;


$k=10;
$rep=1;
for $i(1..$k)
{
	for $j(1..$rep)
	{
	print 	" python structure.py -K $i --input=$file --output=$file\_out.$i$j --full --seed=1 --format=bed\n";
#	print 	" python structure.py -K $i --input=$file --output=$file\_out.$i$j --full --seed=1 --format=str\n";

	system( " python structure.py -K $i --input=$file --output=$file\_out.$i$j --full --seed=1 --format=bed");
#	system( " python structure.py -K $i --input=$file --output=$file|_out.$i$j --full --seed=1 --format=str");
	}
}

system ("python chooseK.py --input=$file");

print "FINISHED------------!\n";

#!/usr/bin/perl -w
#this script will rename the fasta seq downloaded from Phytozome, both pro and dna seqs.

#just enter the first part of the seq name 
#To run, type: perl rename_unigenes.faa.pl bna
#

# you will see two lines like this: this is normal, don't worry!
# readline() on closed filehandle FL at /home/xinshuaiqi/bin/rename_seq.pl line 
# readline() on closed filehandle FL at /home/xinshuaiqi/bin/rename_seq.pl line 
#!/usr/bin/perl -w

#only enter the first part of the seq name 
#To run, type: perl rename.pro.and.dna.pl bna
#


$file = $ARGV[0];
$file2 = $file;

###################################
#rename pro.fa

open FL, "<$file2.pro.fa";
open OUT, ">$file2.fa";

while (<FL>)
{ 
$seq=$_;
$seq=~ s/>.+pacid=(\d+).+/>$file2 $1/g;
print OUT "$seq";
}

close FL;
close OUT;




################################
#renmae dna.fa


open FL, "<$file2.dna.fa";
open OUT, ">$file2.fn";

while (<FL>)
{ 
$seq=$_;
$seq=~ s/>.+pacid=(\d+).+/>$file2 $1/g;
print OUT "$seq";
}

close FL;
close OUT;




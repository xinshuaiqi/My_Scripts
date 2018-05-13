#!/usr/bin/perl -w

#only enter the first part of the seq name 
#To run, type: perl rename_unigenes.faa.pl bna
#

# you will see two lines like this: this is normal, don't worry!
# readline() on closed filehandle FL at /home/xinshuaiqi/bin/rename_seq.pl line 
# readline() on closed filehandle FL at /home/xinshuaiqi/bin/rename_seq.pl line 
#!/usr/bin/perl -w

#only enter the first part of the seq name 
#To run, type: perl rename.unigenes.pl bna
#



$file = $ARGV[0];

###############################faa
open FL, "<$file.unigenes.faa";
open OUT, ">$file.fa";

while (<FL>)
{ 
$seq=$_;
#here put the seq number to the second column, like ">1" => ">$file 1"
$seq=~ s/\>(\d+)/\>$file $1/g;

#here remove all the empty sequences


#print "$seq";
print OUT "$seq";
}

close FL;
close OUT;

###############################fna
open FL, "<$file.unigenes.fna";
open OUT, ">$file.fn";

while (<FL>)
{ 
$seq=$_;
#here put the seq number to the second column, like ">1" => ">$file 1"
$seq=~ s/\>(\d+)/\>$file $1/g;

#here remove all the empty sequences


#print "$seq";
print OUT "$seq";
}

close FL;
close OUT;

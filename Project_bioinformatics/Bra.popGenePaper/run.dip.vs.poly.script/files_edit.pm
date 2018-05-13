#!/usr/bin/perl -w


#open a group of files, then edit them
#this is a mode

@array = glob ("*.txt");    #glob this kind of files in the current folder
foreach $file(@array)
{
############print their name
print "$file\n";



####################rename file name
$newFile =~ s/(\w{3})(.*)(\.fa)/\l$1.dna$3/; #keep the first three letters #change A to a
if(-e $newFile)
{ #if this will lead to two same name files, then stop
warn "Can't rename $file to $newFile. The $newFile exists!\n";
}
else
{
rename $file, $newFile #rename
or
warn "Rename $file to $newFile failed: $!\n"; #if not work, warning
}




#####################search and replace txt in the file
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


}

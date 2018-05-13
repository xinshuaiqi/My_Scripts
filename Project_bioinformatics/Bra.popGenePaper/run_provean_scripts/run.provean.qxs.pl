#!/usr/bin/perl -w
use strict;
#Before start:
#put all protein aligned files in a folder

#lalala
system ("mkdir TEMP"); #this will save all the TEMP files during the analysis

#run provean
print "What is the outgroup three-letter-name?\n";
my $outgroup =<>;

print "Tell me the dip three-letter-name? If moret than one, please split with SPACE\n";
chomp(my $dip =<>);
my $catdip =$dip;
$catdip=~ s/(\w{3})/$1\*/g;

print "Tell me the poly three-letter-name? If moret than one, please split with SPACE\n";
chomp(my $poly =<>);
my $catpoly =$poly;
$catpoly=~ s/(\w{3})/$1\*/g;

###here $catgdip and $catpoly will be used in the later 

#standard.fasta.format.pl
system ("standard.fasta.format.pl");


# open each gene family, 
my @files = glob ("*.aln");
foreach my $file(@files)
{
#find the longest outgroup seq, save it in a refer.fa file 
system ("prepare.refer.fa.pl $file $outgroup");


# run prepare_provean_var.pl; generate var file for each sequence.
system ("prepare.provean.var2.1.pl $file $outgroup");

# glop all var info of dip and poly respectively.
system ("cat $catdip  > dip.var");
system ("cat $catpoly > poly.var");

system ("sort dip.var > dip.var.sort");
system ("sort poly.var > poly.var.sort");

# sort them to make sure no repetitive loci 
# save it in a file  
system ("remove.same.var.afterSort.pl");
#result files are
# dip.var.sort.var
# poly.var.sort.var

#Now remove all - in the refer seq before Provean
system ("sed -i 's/\-//g' refer.fa");



#run provean for dip.var and poly.var in each gene family
#result: 2X gene familly number output files 
print "Start Provean...$file...\n";
system ("provean.sh -q refer.fa -v dip.var.sort.var --save_supporting_set $file.supporting --num_threads 5 >$file.dip.provean.out");
system ("provean.sh -q refer.fa -v poly.var.sort.var --save_supporting_set $file.supporting --num_threads 5 >$file.poly.provean.out ");

#create a folder for this gene family
system ("mkdir TEMP/$file");
#then mv all the temp file except "provean.out" to this folder
system ("mkdir TEMP/$file");
system ("mv *.var TEMP/$file");
system ("mv *.sort TEMP/$file");
system ("mv refer.fa TEMP/$file");


#for each  gene family, test whether poly has more deleterious mutations than dip 

##here for some tech reason, I need to run same script twice,
##only the second on print out the right result
##statistic result was in Final File
#system ("provean.stat1.pl $file.poly.provean.out $file.dip.provean.out");
#system ("provean.stat2.pl $file.poly.provean.out $file.dip.provean.out");

#do statistics for all familly 

#create a folder for this gene family, then move all the intermideate files into this folder 

print "Run_Provean Finished! Cheers!\n";
}

exit;




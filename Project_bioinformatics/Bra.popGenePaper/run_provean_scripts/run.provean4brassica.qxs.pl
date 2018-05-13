#!/usr/bin/perl -w
use strict;
#Before start:
#put all protein aligned files in a folder

#lalala
system ("mkdir TEMP"); #this will save all the TEMP files during the analysis

#run provean
#run provean
print "What is the outgroup three-letter-name?\n";
my $outgroup =<>;

#standard.fasta.format.pl
## no break lines in one fasta seq, so I need to reedit align files
system ("standard.fasta.format.pl");

# open each gene family, 
my @files = glob ("*.aln");
foreach my $file(@files)
{
#find the longest outgroup seq, save it in a refer.fa file 
system ("prepare.refer.fa.pl $file $outgroup");

# run prepare_provean_var.pl; generate var file for each sequence.
system ("prepare.provean.var2.1.pl $file $outgroup");

#combined all var info for each cultivars
system ("cat 63* 62* 153* 154* > A.var"); #sylv
system ("cat 143* 134* 139* 140* > B.var"); #tril
system ("cat 67* 99* 75* 80* > C.var"); #ch
system ("cat 115* 112* 106* 107* > D.var"); #pk

system ("sort A.var > A.var.sort");
system ("sort B.var > B.var.sort");
system ("sort C.var > C.var.sort");
system ("sort D.var > D.var.sort");

#print "wait...qxs\n";
#my $qxs=<>;

### sort them to make sure no repetitive loci 
### save it in a file  
### here is the place remove those error called variations
system ("remove.same.var.afterSort.pl");

###result files are
### A|B|C|D.var.sort.var

###Now remove all - in the refer seq before Provean
system ("sed -i 's/\-//g' refer.fa");

###run provean for dip.var and poly.var in each gene family
###result: 2X gene familly number output files 
print "Start Provean...$file...\n";
system ("provean.sh -q refer.fa -v A.var.sort.var --save_supporting_set $file.supporting --num_threads 4 >$file.A.provean.out");
system ("provean.sh -q refer.fa -v B.var.sort.var --save_supporting_set $file.supporting --num_threads 5 >$file.B.provean.out");
system ("provean.sh -q refer.fa -v C.var.sort.var --save_supporting_set $file.supporting --num_threads 4 >$file.C.provean.out");
system ("provean.sh -q refer.fa -v D.var.sort.var --save_supporting_set $file.supporting --num_threads 5 >$file.D.provean.out");

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
print "Now run 'provean.stat_STEPII.pl'in this folder, you will get the final result in 'FINAL' file\n";
}

exit;




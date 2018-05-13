#!/usr/bin/perl

#this script is one of the three script to run orthMCL

#step A will prepare inputfile, create database, prepare files for step B

#inputfiles are protein seqs of each species,like "ath.fa" , please have all protein seq files renamed as XX.fa

#perl scripts used in this script including:
# NO!
#



#To run,
#create a folder for analysis, then put all your .fa files into the folder 
# cd to the folder, then run: orthMCL-A.pl <folder name, like "LZdata2">
##outputfile: goodProteins.fasta

#before run, please use "rename_pro.fa.pl" and "rename_unigenes.faa.pl" rename the seq name


#save the original input files in the folder "input"
system ("mkdir input");
system ("cp *.fa input/");
system ("cp *.fn input/");




my $runname = $ARGV[0];
system ("ls *.fa >taxa.list");

#set mysql
use DBI;

##login
my $dbh = DBI->connect("dbi:mysql:", "root","qxs718");

##create a database
print 1 == $dbh->do("create database $runname");
print 1 == $dbh->do("GRANT SELECT,INSERT,UPDATE,DELETE,CREATE VIEW,CREATE, INDEX, DROP on $runname.* TO $runname@localhost");
print 1 == $dbh->do("set password for $runname@localhost = password('qxs718')");

##prepare config file
##here the example config file is datasets "LZdata2", in the home directory

system ("cp ../orthomcl.config ./");
system ("find . -type f -name 'orthomcl.config' |xargs perl -pi -e 's|LZdata2|$runname|g'");

system ("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclInstallSchema orthomcl.config");


#edit the taxa.list
system ("find . -type f -name 'taxa.list' |xargs perl -pi -e 's|.fa||g'");

#run this for each protein fasta file, the "id field" should be unique for each sequence
open FL, "<taxa.list";
while (<FL>)
{
$taxa=$_;
chomp $taxa;
print "$taxa";
system ("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclAdjustFasta $taxa $taxa.fa 2");
}


system ("mkdir compliantFasta");
system ("mv *.fasta compliantFasta");   ####这一步有问题，不应该把所有的fasta序列都移到compliantFasta里，只移动原始input
system ("cd compliantFasta");

#filter fastas for good/bad proteins, the suggested values are 10 for minimum length and 20 for max. percent stop codons
system ("perl ~/bin/orthomclSoftware-v2.0.9/bin/orthomclFilterFasta compliantFasta 10 20");

##outputfile: goodProteins.fasta

print "orthMCL-A.pl has finished!!!\n";










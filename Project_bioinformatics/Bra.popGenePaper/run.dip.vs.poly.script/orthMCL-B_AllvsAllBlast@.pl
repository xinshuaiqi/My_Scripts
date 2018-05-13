#!/usr/bin/perl

#this script is one of the three script to run orthMCL

#step B will do all vs all blast on the "goodProteins.fasta" file

#outputfile: my_blastp_output.tsv 

#Before running:
#please create a folder on the server, with same name as "$runname", for example: LZdata3
#mv goodProteins.fasta to the folder
#mv "all-vs-all.blast.pl" script to the folder

#perl scripts used in this script including:
# all-vs-all.blast.pl


# To run: perl all-vs-all.blast.pl goodProteins.fasta 10  # CPU=10

#outputfile: my_blastp_output.tsv 

#please copy the output to local PC, then continue on orthMCL-C.pl

system ("makeblastdb -in goodProteins.fasta -dbtype prot -out my_prot_blast_db");
system ("blastp -db my_prot_blast_db -query goodProteins.fasta -out my_blastp_output.tsv -outfmt '6' -evalue 10e-5 -num_threads 20");

print "Done! qxs\n";

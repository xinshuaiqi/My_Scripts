
# check the total bp of a fasta file. like a genome
grep -v ">" file.fasta | wc | awk '{print $3-$1}'

# check the total reads number after cleaning, use fastqc html results.
grep -Po "Total Sequences\<\/td\>\<td\>\d+" */* >Total.sequences

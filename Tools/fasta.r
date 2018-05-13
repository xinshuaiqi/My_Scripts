

# check the total bp of a fasta file. like a genome
grep -v ">" file.fasta | wc | awk '{print $3-$1}'

# check the total reads number after cleaning, use fastqc html results.
grep -Po "Total Sequences\<\/td\>\<td\>\d+" */* >Total.sequences

Mean Length Of Fasta Sequences#Tips in Bioinfo

awk '{/>/&&++a||b+=length()}END{print b/a}' file.fa

# report seq length of each fasta seq:
awk '/^>/ {if (seqlen){print seqlen}; print ;seqlen=0;next; } { seqlen = seqlen +length($0)}END{print seqlen}' file.fa

>header1 
117 
>header2 
3 
>header3 
45

rename fastq seq name
## 将所有的蛋白序列重新编号成1,2,3,4， rename fasta sequence
awk '/^>/{print ">" ++i; next}{print}' < brassicaceae7spp >brassicaceae7spp





##
#this script will extract gene name from Bra1.5 list

open (FL, "3together.list") or die "can not open input";

#

foreach $line (<FL>){
chomp $line;
# grep fasta seq based on sequence name, the head line and one more line for seq itself.
system ("grep '$line' Bra1.5_24668_CDS.fasta -A 1 >> grep.out.fasta"); 
}

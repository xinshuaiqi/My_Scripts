##
#this script will extract gene name from Bra1.5 list

#open (FL, "3together.vs.4RNAseq.list") or die "can not open input";
open (FL, "3together.list") or die "can not open input";
#open (FL, "14.lost") or die "can not open input";

foreach $line (<FL>){
chomp $line;
#print "$line\n";

#system ("grep '$line' Bra1.5.gene.list >> WGT.RNAseq.list.circos"); 
system ("grep '$line' Bra1.5.gene.list >> WGT.list.circos"); 
#system ("grep '$line' Bra1.5.gene.list "); 
}

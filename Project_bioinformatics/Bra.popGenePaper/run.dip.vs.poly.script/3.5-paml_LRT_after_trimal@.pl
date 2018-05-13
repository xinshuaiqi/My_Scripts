#!/usr/bin/perl

#within paml folder
system ("mkdir result/tree");
system ("cp result/dnaaln/* result/tree");


print "Tell me what is the outgroup used in RAxML analysis\n";
$out = <>;


#format for paml
print "\n\n\tRunning PAML\n\n";

system ("mkdir result/phy/");

#system ("mv dnapairnumber ./result/dnaaln/");
#print "please mv dnapairnumber to dnaaln folder, edit the totoal family number\n";
#print "Then ENTER\n";
#$qxs = <>;

#prepare phy for paml
system ("cd result/dnaaln; iterativefasta2phylip.pl");  #～～～～～～
system ("cd result/dnaaln; mv *.phy ../phy/");


#run fasta to phy, then raxml, 
system ("cd result/tree/;fasta2phy4raxml+tree_format4paml_1.pl $out");
#format tree
system ("cd result/tree/;fasta2phy4raxml+tree_format4paml_2.pl");

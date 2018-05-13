#!/usr/bin/perl -w

#this script is designed to edit "newtest.pl"
#each time, it will read the info from "taxa.list", then replace this line in newtest.pl
# "	if ($line =~ m/(^ORG_.+cat.+gin.+lgm.+oph.+pmo.+smo.+tma.+)/) {"

open FL, "taxa.list";

$ORG = "";

while (<FL>)
{
$spp = $_;
chomp $spp;
$ORG =$ORG.$spp.".+";
}

print "$ORG\n";
#print 	"if \(\$line\s\=\~\sm\/\(\^ORG\_\.\+$ORG\)/) {\n";

#open newtest, "bin/newtest.pl";
#replace
#sed "s/\.(.+)\)\//\.qxs\)\//" newtest>newtest2
##
#


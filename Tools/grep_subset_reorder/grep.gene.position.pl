##
#this script will extract gene name from Bra1.5 list
#$file= "115FstPi_SweeD_share.list";

#to run: perl grep.gene.postion.pl <input list> <target file>

# input file search list  , such as gene name list
chomp($file=$ARGV[0]);
print "$file\n";
#inputfile search target  # such as full information list
chomp($target=$ARGV[1]);
print "$targe\n";

open (FL, $file) or die "can not open $file";

foreach $line (<FL>){
chomp $line;
#print "$line\n";
system ("grep '$line' $target >> $file.'out'"); 
}

print "done!\n";

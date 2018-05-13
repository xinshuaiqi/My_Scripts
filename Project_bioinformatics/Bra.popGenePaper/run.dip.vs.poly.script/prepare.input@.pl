#!/usr/bin/perl -w

#prepare inputfiles, rename them as input.pros

#!/usr/perl


#here rename phytozome files 
#eg: BrapaFPsc_277_v1 => bra.pro.fa
foreach my$file (glob "*.fa"){ 
my $newFile = $file;
$newFile =~ s/(\w{3})(.*)(\.fa)/\l$1.pro$3/; #keep the first three letters #change A to a
if(-e $newFile)
{ #if this will lead to two same name files, then stop
warn "Can't rename $file to $newFile. The $newFile exists!\n";
}
else
{
rename $file, $newFile #rename
or
warn "Rename $file to $newFile failed: $!\n"; #if not work, warning
}
}

#here rename mike unigene file
#eg: BrapaFPsc_277_v1 => bra.pro.fa
foreach my$file (glob "*.unigenes")
{ 
my $newFile = $file;
$newFile =~ s/(\w)\w*_(\w{2})\w*.unigenes/$1$2.pro.fa/; #rename as three letter files, like ath
if(-e $newFile){ #if this will lead to two same name files, then stop
warn "Can't rename $file to $newFile. The $newFile exists!\n";
}else{
rename $file, $newFile #rename
or
warn "Rename $file to $newFile failed: $!\n"; #if not work, warning
}
}

#here rename mike unigene file
#eg: bna.unigenes.faa => bna.fa
foreach my$file (glob "*.unigenes.faa")
{ 
my $newFile = $file;
$newFile =~ s/(...).unigenes.faa/$1.fa/; #rename as three letter files, like ath
	if(-e $newFile){ #if this will lead to two same name files, then stop
	warn "Can't rename $file to $newFile. The $newFile exists!\n";
	}
	else
	{
	rename $file, $newFile #rename
	or
	warn "Rename $file to $newFile failed: $!\n"; #if not work, warning
	}
}

#eg: bna.unigenes.fna => bna.fn
foreach my$file (glob "*.unigenes.fna")
{ 
my $newFile = $file;
$newFile =~ s/(...).unigenes.fna/$1.fn/; #rename as three letter files, like ath

	if(-e $newFile)
	{ #if this will lead to two same name files, then stop
	warn "Can't rename $file to $newFile. The $newFile exists!\n";
	}
	else
	{
	rename $file, $newFile #rename
	or
	warn "Rename $file to $newFile failed: $!\n"; #if not work, warning
	}
}







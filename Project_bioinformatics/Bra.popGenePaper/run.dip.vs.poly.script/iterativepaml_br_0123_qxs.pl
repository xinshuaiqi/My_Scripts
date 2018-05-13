#!/usr/bin/perl



use warnings;

$CONTROL = "mastercodeml_lrt1.ctl";
$CONTROL2 = "mastercodeml_br.ctl";

$INFILE = "dnapairnumber";
$PAMLOUT = "pamlout";
$TREE = "tree_master_br";


@taxa = @ARGV;

#get the count for the number of alignments
open INFILE or die "no file $INFILE\n";
$count = 0;
while (<INFILE>) {
	chomp $_;
	$count = $_;
}
close INFILE;

open OUTFILE3, ">lrt_br.txt";
open OUTFILE4, ">wrong.seq.txt";

for ($i=0; $i < $count; $i++){
	$ALN = "dnaaln$i.phy";
	open ALN or print OUTFILE4 "no file $ALN\n";
	@aln = ();
	#here 
	while (<ALN>){
		chomp $_;
		@temp0 = split /\s/, $_; 
		if ($temp0[0] ne ''){            #check if $temp[0] is not empty
			push @aln, $temp0[0];
		}
	}
	close ALN;
	print "@aln\n\nqxs\n";
	#$qxs=<>;


	#if ( scalar @aln == scalar @taxa)
	if (1>0)
			{
		
#		#replace the tree_master_br file with real tree file
		system ("cp RAxML_bestTree.dnaaln$i.fasta tree_master_br");
#		# get tree file, and put in gene names for each species
		$TREE = "tree_master_br";
		open TREE or print "can't open TREE";
		open OUTFILE2, ">tree";
		while (<TREE>){
			print $_;
			foreach $taxon (@taxa) {
				@temp = grep /$taxon/, @aln;
					
#				#$_ =~ s/$taxon/$temp[0]/;   # this line is for old format, no longer needed
				$_ = $_;
				}
			print OUTFILE2 $_;
			print $_;
		}
		# run the two LRTs, with 3 different codeml runs
		@ll = ();
		@temp = ();
		@temp2 = ();
		@temp3 = ();
		@temp4 = ();
		@names = ();
#		$names2;
		
		# first run the first codeml run, and get likelihood value
		print "1st run \n\n";
		
		open CONTROL or die "no control file $CONTROL\n";
		open OUTFILE, ">codeml.ctl";
		while (<CONTROL>) {
			$_ =~ s/QQQQQQQ/dnaaln$i.phy/;
			print OUTFILE $_;
		}
		close OUTFILE;
		close CONTROL;
		
		system ("codeml codeml.ctl");
		system ("cp pamlout pamlout_model0_$i");
	#	print "finished 1st run, check model0_$i\n";
	#	$qxs =<>;	
		
		open PAMLOUT or die "no file PAMLOUT\n";
		while (<PAMLOUT>){
			push @temp, $_;
		}
	
		@temp2names = grep /\#/, @temp;
		@temp2 = grep /lnL/, @temp;
		@temp3 = split /\s/, $temp2[0];
		@temp4 = grep /\-/, @temp3;
		push @ll,  $temp4[0];

	#	print "end of first run\n";
	#	$qxs = <>;


		# run the secold codeml and get likelihood value
		@temp = ();
		@temp2 = ();
		open CONTROL2 or die "no control file $CONTROL2\n";
		open OUTFILE, ">codeml.ctl";
	
		while (<CONTROL2>) {
			$_ =~ s/QQQQQQQ/dnaaln$i.phy/;
			print OUTFILE $_;
		}
		close OUTFILE;
		close CONTROL2;
		
		system ("codeml codeml.ctl");
		system ("cp pamlout pamlout_model2_$i");

		open PAMLOUT or die "no file PAMLOUT\n";
		while (<PAMLOUT>){
			push @temp, $_;
		}
	
		@temp2 = grep /lnL/, @temp;
		@temp3 = split /\s/, $temp2[0];
		@temp4 = grep /\-/, @temp3;
		push @ll,  $temp4[0];
	

		$lrt1 = 2 * ($ll[1] - $ll[0]);
		pop @temp2names;
		foreach (@temp2names){
			$_ =~ s/\#\d*//g;
			$_ =~ s/\s//g;
			$_ =~ s/\://g;
			chomp $_;
			push @names, $_;
		}
		$ll1 = $ll[0];
		$ll2 = $ll[1];
		print OUTFILE3 "$i\t$ll1\t$ll2\t$lrt1\n";
		print "\nanother line of output:\n$i\t$ll1\t$ll2\t$lrt1\n";
		}
}
close OUTFILE;


close OUTFILE4;
exit;
	

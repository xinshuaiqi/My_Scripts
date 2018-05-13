#!/usr/bin/perl



use warnings;

$CONTROL = "mastercodeml_lrt1.ctl";
$CONTROL2 = "mastercodeml_br.ctl";
$CONTROL3 = "mastercodeml_br2.ctl";
$CONTROL4 = "mastercodeml_br3.ctl";
$INFILE = "dnapairnumber";
$PAMLOUT = "pamlout";
$TREE = "tree_master_br";
@log_likelihoods = ();
@ml_trees = ();
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

for ($i=0; $i < $count; $i++){
	$ALN = "dnaaln$i.phy";
	open ALN or die "no file $ALN\n";
	@aln = ();
	while (<ALN>){
		chomp $_;
		@temp0 = split /\s/, $_;
		if ($temp0[0] ne ''){
			push @aln, $temp0[0];
		}
	}
	close ALN;
	print "@aln\n\n";
	if ( scalar @aln == scalar @taxa){
		# get tree file, and put in gene names for each species
		open TREE;
		open OUTFILE2, ">tree";
		while (<TREE>){
			print $_;
			foreach $taxon (@taxa) {
				@temp = grep /$taxon/, @aln;
					
				$_ =~ s/$taxon/$temp[0]/;
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
		$names2;
		# first run the first codeml run, and get likelihood value
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
	
		open PAMLOUT or die "no file PAMLOUT\n";
		while (<PAMLOUT>){
			push @temp, $_;
		}
	
		@temp2names = grep /\#/, @temp;
		@temp2 = grep /lnL/, @temp;
		@temp3 = split /\s/, $temp2[0];
		@temp4 = grep /\-/, @temp3;
		push @ll,  $temp4[0];

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
	
		# run the third codeml run, and get that likelihood value
		@temp = ();
		@temp2 = ();
		open CONTROL3 or die "no control file $CONTROL3\n";
		open OUTFILE, ">codeml.ctl";
	
		while (<CONTROL3>) {
			$_ =~ s/QQQQQQQ/dnaaln$i.phy/;
			print OUTFILE $_;
		}
		close OUTFILE;
		close CONTROL3;
		
		system ("codeml codeml.ctl");
		system ("cp pamlout pamlout_Anull_$i");

		open PAMLOUT or die "no file PAMLOUT\n";
		while (<PAMLOUT>){
			push @temp, $_;
		}
	
		@temp2 = grep /lnL/, @temp;
		@temp3 = split /\s/, $temp2[0];
		@temp4 = grep /\-/, @temp3;
		push @ll,  $temp4[0];

		# run the fourth codeml run, and get that likelihood value
		@temp = ();
		@temp2 = ();
		open CONTROL4 or die "no control file $CONTROL4\n";
		open OUTFILE, ">codeml.ctl";

		while (<CONTROL4>) {
			$_ =~ s/QQQQQQQ/dnaaln$i.phy/;
			print OUTFILE $_;
		}
		close OUTFILE;
		close CONTROL4;
		
		system ("codeml codeml.ctl");
		system ("cp pamlout pamlout_A_$i");

		open PAMLOUT or die "no file PAMLOUT\n";
		while (<PAMLOUT>){
			push @temp, $_;
		}
	
		@temp2 = grep /lnL/, @temp;
		@temp3 = split /\s/, $temp2[0];
		@temp4 = grep /\-/, @temp3;
		push @ll,  $temp4[0];

		$lrt1 = 2 * ($ll[1] - $ll[0]);
		$lrt2 = 2 * ($ll[3] - $ll[2]);
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
		$ll3 = $ll[2];
		$ll4 = $ll[3];
		$names2 = join "\t", @names;
		print OUTFILE3 "$i\t$names2\t$ll1\t$ll2\t$ll3\t$ll4\t$lrt1\t$lrt2\n";
		print "\nanother line of output:\n$i\t$names2\t$ll1\t$ll2\t$ll3\t$ll4\t$lrt1\t$lrt2n";
	}
}
close OUTFILE;
exit;
	

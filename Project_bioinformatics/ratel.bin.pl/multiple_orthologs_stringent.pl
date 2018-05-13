#!/usr/bin/perl

# Important: must have in same folder parsed blast output (query=hit=score) for each pair of taxa

$num_taxa = 0;
@taxa_list = @ARGV;
@orthologs_mult = ();
@all_orthologs = ();
@comparison = ();
@taxa = ();
# get rid of duplicates in the list of taxa
@taxa_list = sort @taxa_list;
$last = "";
foreach (@taxa_list){
	if ($_ eq $last){
		next;
	}
	else {
		push @taxa, $_;
		$last = $_;
	}
}
$num_taxa = scalar @taxa;


for ($i = 0; $i <($num_taxa-1); $i++){
	for ($j=($i+1); $j< $num_taxa; $j++){
		$INFILE1 = "parsed.hits.$taxa[$i]vs$taxa[$j]";
		$INFILE2 = "parsed.hits.$taxa[$j]vs$taxa[$i]";

		my %hitqual = ();
		my %hit = ();
		my %hitqual2 = ();
		my %hit2 = ();
		my @orthologs = ();

		open INFILE1 or die "No file $INFILE1\n";
	
		#read in the list of hits, pick out the best hit for each gene, assign to hash - query and hit
		while (<INFILE1>) {
			chomp $_;
			my @fields = split /=/, $_;
			my $query = $fields[1];
			my $hit = $fields[0];
			my $quality = $fields[2];
			if ($hitqual{$query} > $quality){}else{
				$hitqual{$query} = $quality;
				$hit{$query} = $hit;
			}
		}
		close INFILE1;
		open INFILE2 or die "No file $INFILE2\n";

		#read in the list of hits, pick out the best hit for each gene, assign to hash - query and hit
		while (<INFILE2>) {
			chomp $_;
			my @fields = split /=/, $_;
			my $query = $fields[1];
			my $hit = $fields[0];
			my $quality = $fields[2];
			if ($hitqual2{$query} > $quality){}else{
				$hitqual2{$query} = $quality;
				$hit2{$query} = $hit;	
			}
		}
		close INFILE2;
		# Find the reciprocal best hits (orthologs). 
		foreach (keys(%hit)){
			my $hit = $hit{$_};
			if ($_ eq $hit2{$hit}) {
				push @orthologs, "$_\t $hit\t";
			}
		}

		$all_orthologs[$i][$j] = [ @orthologs ];
	

	}
}
@orthologs0 = @{$all_orthologs[0][1]};

foreach my $line (@orthologs0){
	$good = 1;
	my @tabs = split / /, $line;
	my $hit = $tabs[1];
	my $query = $tabs[0];
	@orths = ();
	push @orths, $hit;
	push @orths, $query;
	for ($j =2; $j < ($num_taxa); $j++){
		my @orthologs2 = @{$all_orthologs[0][$j]};
			my @temp1 = grep /$hit/, @orthologs2;
		my @tabs1 = split / /, $temp1[0];
		my $hit1 = "";
		if ($tabs1[0] eq $hit){
			$hit1 = $tabs1[1];
		}
		else {
			$hit1 = $tabs1[0];
		}
		if ($hit1 ne ''){
			push @orths, $hit1;
		} 
	}
	if ((scalar (@orths)) == ($num_taxa)){
	}
	else {$good = 0; next;}
	for ($i = 1; $i < ($num_taxa-1); $i++){
		for ($j=$i+1; $j< $num_taxa; $j++){
			my @orthologs3 = @{$all_orthologs[$i][$j]};
			my @temp1 = grep /$orths[$j]/, @orthologs3;
			my @tabs1 = split / /, $temp1[0];
			my $hit1 = "";
			my $hit2 = "";
			if ($tabs1[0] eq $hit){
				$hit1 = $tabs1[1];
			}
			else {
				$hit1 = $tabs1[0];	
			}
			my @temp2 = grep /$orths[$i]/, @orthologs3;
			my @tabs2 = split / /, $temp2[0];
			if ($tabs2[0] eq $query){
				$hit2 = $tabs2[1];
			}
			else {
				$hit2 = $tabs2[0];
			}
			unless ($hit1 eq $hit2 && $hit1 ne '') {
				$good = 0; 
			}
		}
	}
	if ($good == 1){push @orthologs_mult, "@orths";}
}



	


# Print out a file with all the orthologs in it
foreach (@orthologs_mult){
	$_ =~ s/ //g;
	$_ =~ s/\t/=/g;
	print "$_\n";
}

 
exit;


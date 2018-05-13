#!/usr/bin/perl

my @query = ();
my @hits = ();
my %family_id = ();
my (@families, @family);
my (@families_lines, @family_lines);
my @remove = ();
my @keep = ();
my @lines = ();
my @lines_hits = ();
my $family_count=0;
my @ks_values = ();
my @ks_output = ();

my @lines_less = ();
$INFILE = "no_zero_ks";

open INFILE or die "No file $INFILE";

while (<INFILE>){
	push @lines, $_;
}
shift @lines;
# make single-linkage family clusters (genes which are related by at least one common hit)
while (scalar @lines){
	@family = ();
	@family_lines= ();
	my @tabs = ();        foreach (@ks_values){
            my @tabs7 = split /\t/, $_;
            if ($tabs7[0] ne $query && $tabs7[0] ne $hit && $tabs7[1] ne $query && $tabs7[1] ne $hit){
                push @ks_values_new, $_;

            }
        } 
	$first = shift @lines;
	push @family_lines, $first;
	chomp $first;
	@tabs = split /\t/, $first;
	push @family, $tabs[0];
	push @family, $tabs[1];

	my $count = 0;
	while ($count < scalar @family){
		
		@lines_hits = grep /$family[$count]/, @lines;
		@lines_less = grep !/$family[$count]/, @lines;
		@lines = @lines_less;
		for ($i=0;$i < scalar @lines_hits;$i++){
			my @tabs2 = ();
			push @family_lines, $lines_hits[$i];
			chomp $lines_hits[$i];
			@tabs2 = split /\t/, $lines_hits[$i];
			unless (grep /$tabs2[0]/, @family ){
				push @family, $tabs2[0];
			}
			unless (grep /$tabs2[1]/, @family ){
				push @family, $tabs2[1];
			}
		}
		$count++;
	}
	push @families, [@family];
	push @families_lines, [@family_lines];
	
	$family_count++;
}
open OUTFILE, ">final_ks_values";
print OUTFILE "Branch1\tBranch2\tNode Ks\tLargest SE\tAth Annotation\tGenbank Annotation Query\tGenbank Annotation Hit\tGenbank Annotation Description\n";

$INFILE3 = "annotations";
open INFILE3 or die "no file $INFILE3\n";
	while (<INFILE3>){
		push @infile3, $_;
			}
close INFILE3 ;

$INFILE4 = "ath_annotations";
open INFILE4 or die "no file $INFILE4\n";
	while (<INFILE4>){
		push @infile4, $_;
			}
close INFILE4 ;


# now calculate ks for independent duplication events, by nj method
for ($i=0;$i<$family_count;$i++){
	@ks_values = @{$families_lines[$i]};

	
	# pull off the node with the lowest ks, until no nodes are left
	while (scalar @ks_values){

		@ks_values_new = ();
		$lowest_ks = 1000;
		$lowest_line = "";
		$lowest_line_no=0;
		$query = "";
		$hit = "";
		$se_largest = 0;
		$se = 0;
		@query_match =();
		@hit_match = ();
		#find lowest ks value
		for ($j=0; $j< scalar @ks_values; $j++){
			chomp $ks_values;
			my @tabs3 = split /\t/, $ks_values[$j];
			my $ks = $tabs3[2];
			if ($ks < $lowest_ks) {
				$lowest_ks = $ks;
				$lowest_line = $ks_values[$j];
				$query = $tabs3[0];
				$hit = $tabs3[1];
				$lowest_line_no = $j;
				$se = $tabs3[3];
			}
		}
		push @ks_output, $lowest_ks;
		# pull out the terminal node, and print them
		chomp $se;
		
		
		my @dos = split /_/, $hit;
		@dos[0]=~ s/x//g;
		@prots = grep /^@dos[0]\t/, @infile3;
		@athhit = grep /^@dos[0]\t/, @infile4;
		$uno = pop(@prots);
		$ath = pop(@athhit);
		chomp $uno;
		chomp $ath;
		my @goano = split /\t/, $ath;
		print OUTFILE "$query\t$hit\t$lowest_ks\t$se\t@goano[1]\t$uno\n";
		splice (@ks_values,$lowest_line_no,1);
		        
		foreach (@ks_values){
            my @tabs7 = split /\t/, $_;
            if ($tabs7[0] ne $query && $tabs7[0] ne $hit && $tabs7[1] ne $query && $tabs7[1] ne $hit){
                push @ks_values_new, $_;

            }
        } 
		# average new branch lengths and calculate new se values for remaining branches
		@query_match = grep /$query/,@ks_values;
		@hit_match = grep /$hit/,@ks_values;
		foreach (@query_match){
			$ks_new = 0;
			$se_new = -1;
			$name = "$hit\_$query";
			$name2 = "";
			chomp $_;
			@tabs4 = split /\t/, $_;
			if ($tabs4[0] eq $query){
				@greps = grep /$tabs4[1]/, @hit_match;
				if (scalar @greps){
					@tabs5 = split /\t/, $greps[0];
					$ks_new = (($tabs4[2] + $tabs5[2]) / 2);
					if ($tabs4[3]>$tabs5[3]){
						$se_new = $tabs4[3];
					}
					else{
						$se_new = $tabs5[3];
					}
					
					@temp = grep !/$tabs4[1]/, @hit_match;
					@hit_match = @temp;
				}
				else {
					$ks_new = $tabs4[2];
					$se_new = $tabs4[3];
				}
				$name2 = $tabs4[1];
			}
			else {
				@greps = grep /$tabs4[0]/, @hit_match;
				if (scalar @greps){
					@tabs5 = split /\t/, $greps[0];
					$ks_new = (($tabs4[2] + $tabs5[2]) / 2);
					if ($tabs4[3]>$tabs5[3]){
						$se_new = $tabs4[3];
					}
					else{
						$se_new = $tabs5[3];
					}
					@temp = grep !/$tabs4[0]/, @hit_match;
					@hit_match = @temp;
				}
				else {
					$ks_new = $tabs4[2];
					$se_new = $tabs4[3];
				}
				$name2 = $tabs4[0];
			}
			push @ks_values_new, "$name\t$name2\t$ks_new\t$se_new";
		}
		foreach (@hit_match){
			$ks_new = 0;
			$se_new = 0;
			$name = "$hit\_$query";
			$name2 = "";

			@tabs6 = split /\t/, $_;
			$ks_new = $tabs6[2];
			$se_new = $tabs6[3];
			if ($tabs6[0] eq $hit){
				$name2 = $tabs6[1];
			}
			else {
				$name2 = $tabs6[0];
			}
			push @ks_values_new, "$name\t$name2\t$ks_new\t$se_new";
		}
		@ks_values = @ks_values_new;
	}
}
close OUTFILE;
				
exit;

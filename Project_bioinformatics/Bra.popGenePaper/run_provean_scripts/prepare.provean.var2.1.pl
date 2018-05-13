#!/usr/bin/perl 
use strict;

#this script will read the refer seq and each dip, poly seq into array @refer @seq, then compare them generate provean var inputfile
#To run, you need to type in the fasta file 
#like: prepare.provean.var.pl protein_alignments1000.aln ath




#read the gene family fasta file into this script 
my $input = $ARGV[0]; #input gene family file, protein seq
my $outgroup = $ARGV[1];  #outgroup name   #not really useful

#Now check the longest gene family and save it in ""refer.fa""



#read the refer seq into array

open R, "refer.fa";  #input query/refer seq 
my @refer = <R>;
#print @refer;

my @refer2;
my $refer;
my $refer2;

foreach $refer(@refer)
{
if ($refer=~ /\>.*/)
	{}#do nothing
else 
	{
	push (@refer2, $refer);
	}
}

#length of ref seq 
my $reflength =(length $refer2[0]) - 2;
print "The length of ref is $reflength\n";

					 

#print @refer2; 

#read dip seq into array 
#open IN, "dip.fa";             #input hit seqs
open IN, "<$input";             #input hit seqs
my @seqs = <IN>;
my @seqs2;
my $seq;
my @seqname; 

foreach my $seq(@seqs)
{
if ($seq=~ /\>.*/)
	{
	push (@seqname, $seq);  #this is the key for hash
	}
else 
	{
	push (@seqs2, $seq);   # this is the value for hash
	}
}
#print @seqname;
#print @seqs2;

#creat a hash
my %hash;
@hash{@seqname}=@seqs2;    

#print the No. n seq in the hash 
my $seq2;

#print "---------------\n";
#print "$seqname[0]";
#print "$hash{$seqname[0]}\n";


###################
#Now start parsing 
####################
#read the referseq into an array 
#each ATCG is an element
my @A;  #refer seq 
my @B;  #seq *
my $A;
my $B;

#    $refer2;  #this is the refe seq 
@A = split (//, $refer2[0]);


					#-------------------------
					#here create a hash, use $keyw as key, $Ti as the TRUE w value 
					#-------------------------
					foreach my $w (0..$reflength)
					{
					#print "$A[$w] ";
					}
					#print "\n";
					
					
					my $temp1;
					foreach my $w (0..$reflength)
					{
					#print $w;
					$temp1 .=$w." "; 
					}
					#print $temp1."\n";
					my @keyw =split (/ /, $temp1);
					#print @keyw;
					
					#create a new number system for the refer seq , all ""-"" has been ignored. only number those true AA
					my $Tw = 0;
					my $saved_w;
					my $temp2;
					foreach my $w (0..$reflength)
					{
					if ($A[$w] ne "-")
						{$Tw =$Tw +1;
						 $temp2 .= $Tw." "; 
						 $saved_w = $Tw;  #save this value 
						}
					else 
						{$temp2 .=$saved_w." ";}
					}
					#print $temp2."\n";
					my @Tw =split (/ /, $temp2);
				#Now create a hash that link the @keyi and @Ti
				my %keyw2Tw;
				@keyw2Tw{@keyw}=@Tw;  
				##from now on, each time print $out, use $keyw2Tw{$i} instead of $i
				#print $keyw2Tw{6}."\n";
				#print $keyw2Tw{11}."\n";

my $seqname;
foreach $seqname(@seqname)
{



#creat out file name using the seq name 
my $filename = $seqname;
#chomp ($filename);
$filename =~ s/\>(.*)\n/$1/; ######
open OUT, ">$filename.var";
#print OUT $seqname;  
#print $seqname; 
#here is the test for each seq 

#print $hash{$seqname};

#read the $hash{$seqname} into @B
@B = split (//, $hash{$seqname});
#print "$seqname B    @B\n";






#Now compare each element in @A and @B;

foreach my $i (0..$reflength)
{
#print "$i\n";
#print OUT "$A[$i]---$B[$i]\n";  

## |||the above print  will help you understand what happend.




#del
if ($B[$i] eq "-" && $A[$i] ne "-")
{
#check if next loci is also this pattern
	#one loci del
	if ($B[$i+1] ne "-" || $A[$i+1] eq "-")
	{
	my $k=$i+1;
 
	#----------
	#print OUT "$A[$i]"."$k"."del"."\n"; 
	print OUT "$A[$i]"."$keyw2Tw{$i}"."del"."\n"; 
	
	}
	
	#more than one loci????????????????????????????
	else {
			my $j=$i;
			Jjiayi:
			$j=$j+1;
			#print "j= $j\n";
			if (($B[$j] ne "-") || ($A[$j] eq "-"))
				{
				my $k = $i+1;
				my $m = $j-1;
				

				#----------
				#my $out ="$A[$i]"."$k"."\_"."$A[$m]"."$j"."del";
				my $out ="$A[$i]"."$keyw2Tw{$i}"."\_"."$A[$m]"."$keyw2Tw{$m}"."del";
				
				
				$out=~ s/^n.*//g;
				
				
				$out =~ s/.*n$//g;  #remove variation due to the masked loci in delins
				if ($out ne ""){print OUT "$out\n";}
				#mask the deletion region
				for my $ii ($i..$m)
					{#$A[$ii]="n";
					$B[$ii]="n";
					}
				}	
			else{goto Jjiayi;}
	}
}

#ins
if ($A[$i] eq "-" && $B[$i] ne "-")
{
#check if next loci is also this pattern
	#one loci ins
	if 	($A[$i+1] ne "-" || $B[$i+1] eq "-")
	{
		if ($A[$i+1] eq $B[$i+1]) #True single ins
		{
		my $k=$i+1;
		my $m=$i-1;
		#----------@
		#my $out ="$A[$i]"."$k"."ins"."$B[$i]"; 
		my $out ="$A[$m]"."$keyw2Tw{$m}"."_"."$A[$k]"."$keyw2Tw{$k}"."ins"."$B[$i]"; 
		#print $out."\n";
		
		
		$out =~ s/^\-\w+//g;    #remove those indel with del like pattern
		if ($out ne ""){print OUT "$out\n";}
		}
	}
	
	#more than one loci????????????????????????????
	else {
			my $j=$i;
			Jjiayi2:
			$j=$j+1;
			#print "j= $j\n";
			if (($A[$j] ne "-") || ($B[$j] eq "-"))
				{
				
				my $k = $i-1;
				my $m = $j+1;
				
					#the insertion is:
				my $ins;
				my $n =$j-1;
						for my $ii ($i..$n)
						{
						$ins .= $B[$ii];   #concatinate strings to the variable 
						#print "ins= $ins\n";
						}
						
						###########################################################################################################
						#dup     #now here check if the front and following part of the insertion is same as this insertion.
						#		#if so, then this insertion is indeed a duplication
						#########

						#get the location of the sister region of the insertion 
						#both before and following the insertion 
						my $minus = ($n-$i)+1; 
						my $before_i = $i - $minus;
						my $before_n = $n - $minus;
						my $following_i = $i + $minus;
						my $following_n = $n + $minus;
						#print "In this case, $before_i,$before_n,$i,$n,$following_i,$following_n\n";
						#get the string before and following the insertion
						my $before_ins;
						my $following_ins;
						
						for my $ii ($before_i..$before_n)
						{
						$before_ins .= $B[$ii];   #concatinate strings to the variable 
						#print "before_ins= $before_ins\n";
						}
						
						for my $ii ($following_i..$following_n)
						{
						$following_ins .= $B[$ii];   #concatinate strings to the variable 
						#print "following_ins= $following_ins\n";
						}
						
						
						if 	(
							($before_ins eq $ins)
							&&($ins !~ /n+/)
							)
							{
							#print "this is a duplication event before the ins $before_ins = $ins\n";
							my $iii = $before_i;
							my $nnn = $before_n;
							
							
							#----------P4_S6dup
							#my $out ="$A[$before_i]"."$iii"."\_"."$A[$before_n]"."$nnn"."dup";
							my $out ="$A[$before_i]"."$keyw2Tw{$iii}"."\_"."$A[$before_n]"."$keyw2Tw{$nnn}"."dup";
							
							if ($out ne ""){print OUT "$out\n";}
							}
						elsif (
							($following_ins eq $ins)
							&&($ins !~ /n+/)
							)
							{
							#print "this is a duplication event after the ins\n";
							my $iii = $following_i;
							my $nnn = $following_n;
							
							#----------P4_S6dup
							#my $out ="$A[$following_i]"."$iii"."\_"."$A[$following_n]"."$nnn"."dup";
							my $out ="$A[$following_i]"."$keyw2Tw{$iii}"."\_"."$A[$following_n]"."$keyw2Tw{$nnn}"."dup";
							
							
							if ($out ne ""){print OUT "$out\n";}
							}
						
						
						
						
						#############################################################################################################
						else #back to the original if condition 
				{
				
				
				#----------D7_P8insVA
				#my $out ="$A[$k]"."$i"."\_"."$A[$m]"."$n"."ins$ins";
				my $out ="$A[$k]"."$keyw2Tw{$i}"."\_"."$A[$j]"."$keyw2Tw{$j}"."ins$ins";	
				
				#remove things with 'n' before print
				$out =~ s/^n\w+//g;
				$out =~ s/.*n$//g;  #remove variation due to the masked loci in delins
				if ($out ne ""){print OUT "$out\n";}
				
				
				#mask the insertion region
				for my $ii ($i..$n)
					{#$A[$ii]="n";
					$B[$ii]="n";
					}
				#print @A;
				}

				}	
			else{goto Jjiayi2;}
	}
}


#





# regular substitution
if ($A[$i] ne $B[$i])
{
		#single substitution
		if (
			($A[$i+1] eq $B[$i+1])#1
			&& ($A[$i+1] ne "-" && $B[$i+1] ne "-" ) #2
			)
			{
			#if there is - in the $m, then delete this note;
			my $k=$i;#			my $k=$i+1;
			
			
			#----------
			#my $m="$A[$i]"."$k"."$B[$i]";

			my $m="$A[$i]"."$keyw2Tw{$k}"."$B[$i]";
			
			
			$m =~ s/.*\-.*//g;
			$m =~ s/.*n.*//g;  #remove variation due to the masked loci in del

			#then print 
			if ($m ne ""){print OUT "$m\n";}
			}


		#delins =insetion and deletion 
		else 
			{
			my $j=$i;
			Jjiayi3:
			$j=$j+1;
			#print "j= $j\n";
			if 
				(  ($A[$j] eq $B[$j])  #1
				&& ($A[$j] ne "-" && $B[$j] ne "-" ) #2
				&& ($j >= ($i+2)) #3
				)
				
				{
				#print "$A[$j]=$B[$j]\n";
				my $k = $i+1;
				my $m = $j-1;
				
					#the insertion is:
				my $delins;
				my $n =$j-1;
						for my $ii ($i..$n)
						{
						$delins .= $B[$ii];   #concatinate strings to the variable 
						$delins=~ s/-//g;    #remove - in the delins due to alginment 
						#print "ins= $ins\n";
						}
						
				#----------	D7_P8delinsVA
				#my $out = "$A[$i]"."$k"."\_"."$A[$m]"."$j"."delins$delins";
				my $out = "$A[$i]"."$keyw2Tw{$i}"."\_"."$A[$m]"."$keyw2Tw{$m}"."delins$delins";
				
				
				$out =~ s/\-\d+\_(.*)/$1/g;  $out =~ s/(\w\d+)\_\-\d+(.*)/$1$2/g;   #remove those delins start or end with "-"
				$out =~ s/.*n$//g;  #remove variation due to the masked loci in delins
				$out =~ s/^n\w+//g;
				$out =~ s/.*nn+.*//g; #anything with nn+ inside of the regex
				$out =~ s/^\-\w+//g;  #remove variation due to the masked loci in dup
				
				#print OUT "$out\n";
				if ($out ne ""){print OUT "$out\n";}
				
				#mask the insertion region
				for my $ii ($i..$n)
					{#$A[$ii]="n";
					$B[$ii]="n";
					}
				#print @A;
				#print @B;
				#remove things with 'n' before print
				
				

				}	
			else{goto Jjiayi3;}			
			}
}		


#this is the end of the entire seq
}
#this is the end of the entire loop
}
close R;
close IN;
close OUT;

print "Call var finished!!!\n";
exit;
























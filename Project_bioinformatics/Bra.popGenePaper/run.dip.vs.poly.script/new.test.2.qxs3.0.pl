#!/usr/bin/perl
use strict;
#use warnings;

#####check if all spceies have at least one seq in the fasta file
# this script will check each "dnaaln*.fasta" file to see if each gene family contain at least one seq of each species.

# run it in the dnaaln folder, after you put trimal filtered seq in the dnaaln folder.
#read dnaaln, extract the fasta line, extract the species infor from fasta title,

#put each gene family into one line,

# then use methodology in "newtest.pl" to decide whether it match the critaria.
print "please remember to choose the right genus datasets in the script, then ENTER!\n";
my $qxs=<>;


system ("mkdir incomplete.gene.family");


############################################################################################
#CHOOSE the right genus below, then # mask the elsif line based on the number in each array
############################################################################################

#my @spp_poly= ("bna");my @spp_dip= ("bol","bra");my @spp_out= ("ath");	#brassica
#my @spp_poly= ("cma");my @spp_dip= ("cso");my @spp_out= ("mgu");		#centaurea
#my @spp_poly= ("ees");my @spp_dip= ("eti");my @spp_out= ("ptr","rco");	#euporbia
#my @spp_poly= ("fxa");my @spp_dip= ("fve");my @spp_out= ("ppe");	#fragaria
#my @spp_poly= ("gma","gso");my @spp_dip= ("pvu","pco");my @spp_out= ("mtr");	#glycine2
#my @spp_poly= ("ghi");my @spp_dip= ("gar","gra");my @spp_out= ("tca");	#gossypium2
#my @spp_poly= ("hci","htu");my @spp_dip= ("han");my @spp_out= ("mgu");	#helianthus2
#my @spp_poly= ("ipb");my @spp_dip= ("ipn");my @spp_out= ("sly");	#ipomoea
#my @spp_poly= ("mdo");my @spp_dip= ("ppe");my @spp_out= ("fve");	#malus
#my @spp_poly= ("mac");my @spp_dip= ("mba");my @spp_out= ("osa");	#musa
#my @spp_poly= ("nta","nbe");my @spp_dip= ("nsy");my @spp_out= ("sly");	#nicotiana
#my @spp_poly= ("pxc","pni");my @spp_dip= ("ptr");my @spp_out= ("mes","rco","lus");	#populus
#my @spp_poly= ("pce");my @spp_dip= ("ppe");my @spp_out= ("fve");	#prunus
#my @spp_poly= ("stu");my @spp_dip= ("spe","sly","sch");my @spp_out= ("mgu");	#solanum
#my @spp_poly= ("tae");my @spp_dip= ("tmo","asp","ttu");my @spp_out= ("osa");	#triticum
#my @spp_poly= ("zma");my @spp_dip= ("sbi");my @spp_out= ("osa");	#maize

#my @spp_poly= ("rup");my @spp_dip= ("wal");my @spp_out= ("smo");	#sela
#my @spp_poly= ("bha","bhb","bhc");my @spp_dip= ("bff","bfb","bfc");my @spp_out= ("bsi");	#xyge
my @spp_poly= ("Hua");my @spp_dip= ("Spd");my @spp_out= ("Cem");	#katrina


my @file="";

#my @array = glob ("*.phy");    #glob this kind of files in the current folder
my @array = glob ("*.fasta");    #glob this kind of files in the current folder

open (OUT,">OUT.print");

foreach my $file(@array)
{
	open FL, "<$file";
	#print "$file\n";
	while (<FL>)
	#open each fasta file, read each line into @file,
	{
	
	chomp $_;
	#print $_;
	push @file, $_;
	#print @file;
	}

	# at least one poly seq
	foreach my $spp_poly (@spp_poly)
		{
		#print "$spp\n";
		if (grep /$spp_poly[0]/, @file) 
			{
			#print "found $spp in $file\n";
			#print "Good ";
			}
#		elsif (grep /$spp_poly[1]/,@file) {}
#		elsif (grep /$spp_poly[2]/,@file) {}
		else
			{
			print OUT "DID NOT found $spp_poly in $file\n";
			system ("mv $file incomplete.gene.family/");
			}
		}

	# at least one dip seq
	foreach my $spp_dip (@spp_dip)
		{
		#print "$spp\n";
		if (grep /$spp_dip[0]/, @file) 
			{
			#print "found $spp in $file\n";
			#print "Good ";
			}
#		elsif (grep /$spp_dip[1]/,@file) {}
#		elsif (grep /$spp_dip[2]/,@file) {}
		else
			{
			print OUT "DID NOT found $spp_dip in $file\n";
			system ("mv $file incomplete.gene.family/");
			}
		}

	# at least one out seq
	foreach my $spp_out (@spp_out)
		{
		#print "$spp\n";
		if (grep /$spp_out[0]/, @file) 
			{
			#print "found $spp in $file\n";
			#print "Good ";
			}
#		elsif (grep /$spp_out[1]/,@file) {}
#		elsif (grep /$spp_out[2]/,@file) {}
		else
			{
			print OUT "DID NOT found $spp_out in $file\n";
			system ("mv $file incomplete.gene.family/");
			}
		}





	@file =""; #clean @file;
	close FL;
		
}

close OUT;
print "Done!\n";
exit;


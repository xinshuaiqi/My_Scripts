#!/usr/bin/perl

#################
# Barker lab, University of Arizona
# January 2013
#
# To run DupPipe from /bin on ratel: put this file (bin_duppipe.pl), the datafile(s) to run, 
# and a file with a list of their names, wherever in your folder you like. 
# To execute the pipeline, enter at the command line prompt: perl bin_duppipe.pl <names_file> 4
#
#################

use warnings;

$NAME = "$ARGV[0]";
$CPU = "$ARGV[1]";
open NAME or die "No file $NAME\n";


LOOP1: while (<NAME>) {
	chomp $_;
        $taxon = $_;
        open PIPE, "uptime |";
        my $line = <PIPE>;
        close PIPE;
        $line =~ s/\s//g;
        my @lineArr =  split /:/, $line;
        my $times = $lineArr[@lineArr-1];
        my @timeArr = split /,/, $times;
        my $load = $timeArr[0] + $CPU;
	print $load," is the current load plus new CPU request\n\n";
       
	if($load < 48) {
		print "Starting pipeline for $taxon!\n\n";
		
		#Put all of your pipeline code in here;
		system ("mkdir DupPipe/");
		system ("mkdir DupPipe/$taxon");
		system ("mkdir DupPipe/$taxon/Data");
		system ("mkdir DupPipe/$taxon/Output");

		#Clean sequence names, remove ones < 300bp, make blast database, dc-mega against itself
		system ("cp $taxon DupPipe/$taxon");
		print "running clcleaner\n\n";
		system ("cd DupPipe/$taxon/; clcleaner.pl $taxon"); # output is: no.cl_$NAME
		system ("cd DupPipe/$taxon/; min_fasta_length.pl no_cl.$taxon 300"); # output is: no_cl.$taxon.minlength$number.  Keeps only sequences longer than 300bp. 
		system ("cd DupPipe/$taxon/; makeblastdb -in no_cl.$taxon.minlength300 -dbtype nucl");
		system ("cd DupPipe/$taxon/; blastn -task dc-megablast -num_threads $CPU -template_length 16 -template_type coding_and_optimal -word_size 11 -perc_identity 30 -evalue 0.01 -db no_cl.$taxon.minlength300 -query no_cl.$taxon.minlength300 -out out.allvsall.$taxon");
		system ("cp DupPipe/$taxon/out.allvsall.$taxon DupPipe/$taxon/Data");

		#Parse duplicates (keep best hits)
        system ("cd DupPipe/$taxon/; dupblastparse.pl out.allvsall.$taxon"); # output is parsed.duppairs.out.allvsall.$taxon
        system ("cp DupPipe/$taxon/parsed.duppairs.out.allvsall.$taxon DupPipe/$taxon/Data");

        #Clean parsed file, keep unique sequences, remove duplicates from list
        system ("cd DupPipe/$taxon/; delete_extra_info.pl parsed.duppairs.out.allvsall.$taxon"); # output is: clean.parsed.duppairs.out.allvsall.$taxon
        system ("cd DupPipe/$taxon/; remove_inline_dups.pl clean.parsed.duppairs.out.allvsall.$taxon"); # output is: no_dups.clean.parsed.duppairs.out.allvsall.$taxon
        system ("cd DupPipe/$taxon/; remove_reciprocal_dups.pl no_dups.clean.parsed.duppairs.out.allvsall.$taxon"); # output is: no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon
        system ("cd DupPipe/$taxon/; list.pl no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon"); # output is: list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon
        system ("cd DupPipe/$taxon/; remove_inline_dups.pl list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon"); # output is: no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon
        system ("cp DupPipe/$taxon/no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon DupPipe/$taxon/Data");		

		#Make filtered fasta file for those sequences in the list
        system ("cd DupPipe/$taxon/; fasta_from_list.pl no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon no_cl.$taxon.minlength300"); # output is: unique_seqs.no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon
        system ("cp DupPipe/$taxon/unique_seqs.no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon DupPipe/$taxon/Data");

        #Make blast db from the unique sequences (why??) but then blast unique sequences against the all-plant-protein database. Parse blast results. 
        system ("cd DupPipe/$taxon/; makeblastdb -in unique_seqs.no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon -dbtype nucl");
        print "\n\n\tLong blasting step at line 69\n\n";
        system ("cd DupPipe/$taxon/; blastx -num_threads $CPU -evalue 0.01 -max_target_seqs 50 -db /usr/bin/25_genome.pep -query unique_seqs.no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon -out out.blastx_$taxon");
        system ("cd DupPipe/$taxon/; blastxparser.pl out.blastx_$taxon"); # output is: blastxparsed.out.blastx_$taxon
        system ("cd DupPipe/$taxon/; delete_extra_infoblastx.pl blastxparsed.out.blastx_$taxon"); # output is: clean.blastxparsed.out.blastx_$taxon
        system ("cd DupPipe/$taxon/; unique_hits_by_column.pl clean.blastxparsed.out.blastx_$taxon"); # output is: unique_col0.clean.blastxparsed.out.blastx_$taxon
        system ("cd DupPipe/$taxon/; tabs.pl unique_col0.clean.blastxparsed.out.blastx_$taxon"); # output is: tab.unique_col0.clean.blastxparsed.out.blastx_$taxon Data/$taxon
        system ("cp DupPipe/$taxon/tab.unique_col0.clean.blastxparsed.out.blastx_$taxon DupPipe/$taxon/Data");
        system ("cd DupPipe/$taxon/; te_remover.pl unique_col0.clean.blastxparsed.out.blastx_$taxon"); # removes TEs. Output is: no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon

        #Make DNA and protein ID lists, then fasta files for DNA and protein sequences, for all genes, in the same order
        print "\n\n\tMaking DNA and protein ID lists at line 79\n\n";
        system ("cd DupPipe/$taxon/; delete_extra_infogenewise.pl no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon");
        system ("cd DupPipe/$taxon/; dna_id_list.pl clean.no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon");
        system ("cd DupPipe/$taxon/; prot_id_list.pl clean.no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon");
        system ("cd DupPipe/$taxon/; dna_fasta.pl dna_ids0.clean.no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon no_cl.$taxon");
        system ("cd DupPipe/$taxon/; prot_fasta2.pl prot_ids1.clean.no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon /usr/bin/25_genome.pep");

        #Make list of gene names
        print "\n\n\tMaking list of gene names at line 87\n";
        system ("cd DupPipe/$taxon/; namelist.pl no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon");

		#Genewise - get DNA and protein sequences for predicted proteins
        print "\n\n\tRunning Genewise\n\n";
        system ("cd DupPipe/$taxon/; iterativegenewise.pl prot_fasta.prot_ids1.clean.no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon dna_fasta.dna_ids0.clean.no_te.unique_col0.clean.blastxparsed.out.blastx_$taxon");
        # system ("cp Programs/wise2.2.0/src/bin/genewise_dnas.fasta DupPipe/$taxon/Data");
        # system ("cp Programs/wise2.2.0/src/bin/genewise_prots.fasta DupPipe/$taxon/Data");

		#Blast unique seqs again, this time against ath.fast database (arabidopsis?). Clean up results.
        print "\n\n\tBlasting against ath.fasta at line 97\n\n";
        system ("cd DupPipe/$taxon/; blastn -task dc-megablast -num_threads $CPU -template_length 16 -template_type coding_and_optimal -word_size 11 -perc_identity 30 -evalue 0.01 -db /usr/bin/ath.fasta -query unique_seqs.no_dups.list.no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon -out out.ath_annotation_$taxon");
        system ("cd DupPipe/$taxon/; athparser.pl out.ath_annotation_$taxon"); # output is: parsed.out.ath_annotation_$taxon
        system ("cd DupPipe/$taxon/; delete_extra_infoblastx.pl parsed.out.ath_annotation_$taxon"); # output is: clean.parsed.out.ath_annotation_$taxon
        system ("cd DupPipe/$taxon/; unique_hits_by_column.pl clean.parsed.out.ath_annotation_$taxon"); # output is: unique_col0.clean.parsed.out.ath_annotation_$taxon
        system ("cd DupPipe/$taxon/; tabs.pl unique_col0.clean.parsed.out.ath_annotation_$taxon"); # output is: tab.unique_col0.clean.parsed.out.ath_annotation_$taxon
        system ("cp DupPipe/$taxon/tab.unique_col0.clean.parsed.out.ath_annotation_$taxon DupPipe/$taxon/Data");
        system ("cp DupPipe/$taxon/no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon DupPipe/$taxon/Data");

        #Prepare gene pairs using protein-guided alignments, get DNA sequences for protein alignments
        print "\n\n\tPreparing pairs at line 107\n\n";
        system ("cd DupPipe/$taxon/; dnafile.pl no_recip_dups.no_dups.clean.parsed.duppairs.out.allvsall.$taxon"); #output is DNA1 and DNA2
        system ("cp DupPipe/$taxon/DNA* DupPipe/$taxon/Data");

        print "\n\n\tRunning MUSCLE\n\n";
        system ("cd DupPipe/$taxon/; iterativemuscle.pl DNA1 DNA2 genewise_prots.fasta");
        system ("cd DupPipe/$taxon/; iterativerevtrans.pl DNA1 DNA2 genewise_dnas.fasta");
        system ("cp DupPipe/$taxon/dnapairnumber DupPipe/$taxon/Data");

        #Run paml, clean results
		print "\n\n\tRunning paml\n\n";
		system ("cd DupPipe/$taxon/; iterativefasta2phylip.pl"); #formats for paml
		system ("cp DupPipe/$taxon/tab.unique_col0.clean.blastxparsed.out.blastx_$taxon DupPipe/$taxon/annotations");
		system ("cp DupPipe/$taxon/tab.unique_col0.clean.parsed.out.ath_annotation_$taxon DupPipe/$taxon/ath_annotations");
        system ("cd DupPipe/$taxon/; iterativepaml.pl");
        system ("cd DupPipe/$taxon/; find . -mindepth 1 -maxdepth 1 -name \"*.dS\" -printf %f\\\\0 | xargs -0 cat > ksvalues");
        system ("cd DupPipe/$taxon/; find . -mindepth 1 -maxdepth 1 -name \"*.dN\" -printf %f\\\\0 | xargs -0 cat > kavalues");
        system ("cd DupPipe/$taxon/; paml_output_reformat.pl");
        system ("cp DupPipe/$taxon/kavalues DupPipe/$taxon/Data");
        system ("cp DupPipe/$taxon/ksvalues DupPipe/$taxon/Data");
        system ("cp DupPipe/$taxon/pamloutput DupPipe/$taxon/Output/pamloutput_$taxon"); #IMPORTANT OUTPUT #1!!        
        system ("cd DupPipe/$taxon/; zero_ks_remover.pl");
        system ("cd DupPipe/$taxon/; family_ks_cluster.pl");
        system ("cp DupPipe/$taxon/final_ks_values DupPipe/$taxon/Output/final_ks_values_$taxon"); #IMPORTANT OUTPUT #2!!


		#Save all data and programs in a tar file, if you really want to...
		#system ("tar -czvf $taxon.tgz Programs/");
		#system ("mv $taxon.tgz Data/$taxon");
		
		#Remove all intermediate files generated
		print "\n\tDeleting intermediate files!\n\n";
		system ("rm DupPipe/$taxon/dna_names");
		system ("cd DupPipe/$taxon/; echo *.aln | xargs rm");
		system ("rm DupPipe/$taxon/DNA*");
		system ("cd DupPipe/$taxon/; echo pamlout* | xargs rm");
		system ("cd DupPipe/$taxon/; echo *.t | xargs rm");
		system ("cd DupPipe/$taxon/; echo *.dN | xargs rm");
		system ("cd DupPipe/$taxon/; echo *.dS | xargs rm");
		system ("cd DupPipe/$taxon/; echo *.phy | xargs rm");
		system ("rm DupPipe/$taxon/ksvalues");
		system ("rm DupPipe/$taxon/dnapairnumber");
		system ("rm DupPipe/$taxon/no_zero_ks");
		system ("rm DupPipe/$taxon/final_ks_values");
		system ("cd DupPipe/$taxon/; echo *.fasta | xargs rm");
		system ("rm DupPipe/$taxon/dirtycontig");
		system ("cd DupPipe/$taxon/; echo *.fa | xargs rm");
		system ("rm DupPipe/$taxon/genewiseout");
		system ("rm DupPipe/$taxon/nostopcontig");
		system ("rm DupPipe/$taxon/nucseq");
		system ("rm DupPipe/$taxon/protseq");
	#	system ("echo *.unigenes | xargs rm");
		system ("rm DupPipe/$taxon/*.allvsall.$taxon");
		system ("rm DupPipe/$taxon/unique_seqs*");
		system ("rm DupPipe/$taxon/no_cl.*");
		system ("rm DupPipe/$taxon/out.ath_*");
		system ("rm DupPipe/$taxon/*.blastx_$taxon");
		system ("rm DupPipe/$taxon/kavalues");
		system ("rm DupPipe/$taxon/out.*");
		system ("rm DupPipe/$taxon/clean.*");
		system ("rm DupPipe/$taxon/parsed.out.*");
		system ("rm DupPipe/$taxon/tab.unique*");
		system ("rm DupPipe/$taxon/unique_col0*");
		system ("rm DupPipe/$taxon/*fasta.clean*");
		system ("rm DupPipe/$taxon/*.seqs");
		system ("rm DupPipe/$taxon/annotations");
		system ("rm DupPipe/$taxon/ath_annotations");
		system ("rm DupPipe/$taxon/codeml.ctl");
		system ("rm DupPipe/$taxon/rst*");
		system ("rm DupPipe/$taxon/rub");
	}
	
	else{
		sleep(60);
		redo LOOP1;
		
	}
}


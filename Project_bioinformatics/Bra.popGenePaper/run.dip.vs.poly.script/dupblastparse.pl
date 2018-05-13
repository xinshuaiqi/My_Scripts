#!/usr/bin/perl

use strict;
    use Bio::SearchIO;
   
    my $in = new Bio::SearchIO(-format => 'blast', 
                               -file   => "$ARGV[0]");
    while( my $result = $in->next_result ) {
      while( my $hit = $result->next_hit ) {
	while( my $hsp = $hit->next_hsp ) {
	if   ( $hit->name ne $result->query_name){
	  if ( $hsp->length('total') >= 300 ){ 
            if ( $hsp->percent_identity >= 40){ 
	     open (OUT, ">>parsed.duppairs.$ARGV[0]");
		print OUT
		   "Query=", $result->query_name, 
	      	   " , Hit=",       $hit->name, "\n";   
              
	     close OUT; 
            }
      }  
      }
      }
     }
    }
    exit;

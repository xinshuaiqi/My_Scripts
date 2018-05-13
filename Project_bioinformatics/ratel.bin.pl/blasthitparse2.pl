#!/usr/bin/perl



use strict;
    use Bio::SearchIO;
   
    my $in = new Bio::SearchIO(-format => 'blast', 
                               -file   => "$ARGV[0]");
	     				open (OUT, ">parsed.hits.$ARGV[1]");
    while( my $result = $in->next_result ) {
      	while( my $hit = $result->next_hit ) {
		while( my $hsp = $hit->next_hsp ) {
	  		if ( $hsp->length('total') >= 100 ){ 
            			if ( $hsp->percent_identity >= 70){ 

					print OUT $result->query_name, "=", $hit->name, "=", $hsp->percent_identity, "\n";   

            				
      				}  
	
      			}
      		}
     	}
    }
              				close OUT; 
    exit;

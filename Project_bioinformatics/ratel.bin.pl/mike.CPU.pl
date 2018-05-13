$NAME = "$ARGV[0]"; #list of names, file names, etc to run iteratively through a pipeline or a particular program
$CPU = "$ARGV[1]"; #the number of CPUs or threads you want to use for your program.  Note that larger CPU requests may take longer to start because the server needs to have large blocks of CPUs free	
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

		#Put all of your pipeline code in here
		#You can run programs from the command line using the following syntax examples
		#original loader for SATe
		system (" ");
		#loader for MrBayes
		#system("mb<$taxon>log$taxon.txt");
		#system ("cp /home/mike/Translate2/Programs/ncbi-blast-2.2.25+/bin/$taxon /home/mike/Translate2/Data/$taxon/$taxon");
		#system ("cd /home/mike/Translate2/Programs/ncbi-blast-2.2.25+/bin/; perl clcleaner.pl $taxon"); 
		#You can use $CPU to set the number of threads or processors to use in your command
		#You can also use $taxon to push through a particlar file name
		#Feel free to edit, add additional variables, change names, etc
	
	}
	
	else{
		sleep(60);
		redo LOOP1;
		
	}
}


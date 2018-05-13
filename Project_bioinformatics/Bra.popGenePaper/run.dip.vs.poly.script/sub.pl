
$max = &max (3,5,6,7,11,5);
print "the bigest is $max\n";

#----------------------------sub

sub max {
my ($bigest) = shift @_;   # @_ is an array with elements from the bracket
			   # shift the first element to $bigest;
foreach (@_)    # foreach $_(@_)
	{
	print ("$_\n");
	if ($_ > $bigest)
		{$bigest =$_; }
	}
$bigest;
}

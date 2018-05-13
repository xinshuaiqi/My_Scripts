


use threads;
$t1 = threads -> create(t1,  print "calc\n"; sleep 10;  ) ; # launch exe1

$t2 = threads -> create(t2,  print"notepad\n"; sleep 10;  ) ;# launch exe2
$t3 = threads -> create(t3,  print"explorer\n"; sleep 10;  ) ;# launch exe3
#$t1->join(); $t2->join(); $t3->join();
print "dir\n"; # launch exe4

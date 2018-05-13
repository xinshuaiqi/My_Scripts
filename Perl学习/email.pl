for $i (1..10)
{
print "$i\n";
sleep (1);
}


use Mail::Sendmail;
unshift @{$Mail::Sendmail::mailcfg{'smtp'}} , 'smtpgate.email.arizona.edu';

%mail = ( To      => 'qxs@email.arizona.edu',
            From    => 'qxs@email.arizona.edu',
	    subject=>'JOB FINISHED',
            Message => "qxs, your ratel job has done!"
           );

sendmail(%mail)or die $Mail::Sendmail::error;

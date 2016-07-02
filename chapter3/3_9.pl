@array=("hello","perl","world");
foreach $word (@array)	{
	if(length($word)>4){
		print "$word ";
	}
}

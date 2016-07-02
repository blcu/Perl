$line="The most precious possession that 
			 ever comes to a man in this world is a woman's heart .";
#以空格为分隔符，将$line分割成若干子串，并将每个子串存入数组（@array）
@array=split(" ",$line); 

foreach $word (sort @array)	{
	#将长度大于5的子串放入数组（@words）
	if ( length($word)>5 ){  
		push(@words,$word);
	}
}

print "word's length is more than 5:\n";
#有序地遍历数组成员
foreach (sort @words)	{  
	print "$_\t";
}
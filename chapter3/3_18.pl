$line="The most precious possession that 
			 ever comes to a man in this world is a woman's heart .";
#�Կո�Ϊ�ָ�������$line�ָ�������Ӵ�������ÿ���Ӵ��������飨@array��
@array=split(" ",$line); 

foreach $word (sort @array)	{
	#�����ȴ���5���Ӵ��������飨@words��
	if ( length($word)>5 ){  
		push(@words,$word);
	}
}

print "word's length is more than 5:\n";
#����ر��������Ա
foreach (sort @words)	{  
	print "$_\t";
}
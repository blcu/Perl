@name=("Lingkar","Klara","Aurora");
@ages=(26,27,24);

#@name��@agesԪ�ظ�����ͬ��$i<@name������ѭ��
for($i=0;$i<@name;$i++)	{
	#����Ϊkey������Ϊvalue
	$hash{$name[$i]}=$ages[$i];	
}

#������ϣ
foreach $member(sort keys %hash)	{
	print "$member is $hash{$member} years old.\n";
}

#����һ������
if(defined $hash{"Babara"}){
	print "%hash{\"Babara\"}\n";
}else{
	print "Not Found!\n";
}



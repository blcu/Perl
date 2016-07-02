@name=("Lingkar","Klara","Aurora");
@ages=(26,27,24);

#@name和@ages元素个数相同，$i<@name来控制循环
for($i=0;$i<@name;$i++)	{
	#姓名为key，年龄为value
	$hash{$name[$i]}=$ages[$i];	
}

#遍历哈希
foreach $member(sort keys %hash)	{
	print "$member is $hash{$member} years old.\n";
}

#查找一个姓名
if(defined $hash{"Babara"}){
	print "%hash{\"Babara\"}\n";
}else{
	print "Not Found!\n";
}



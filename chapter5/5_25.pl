#程序功能：将字符串中的大写字母替换成小写字母
#采用“tr///”方式
$line="GOALS Are Meant To Be Achieved.";
if ($line =~tr/[A-Z]*/[a-z]/) { 
	print "$line"."\n"; 
}
#采用“s///”方式
$line="GOALS Are Meant To Be Achieved.";
if ($line =~s/[A-Z]*/[a-z]/) { 
	print "$line"."\n"; 
}


#程序功能：将字符串中的小写字母替换成大写字母
$line="Goals are meant to be achieved.";
#翻译集字符个数较被翻译集字符个数少
if($line=~tr/a-n/A-Z/){
	print "$line";
}


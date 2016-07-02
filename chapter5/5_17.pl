#程序功能：判断$line中是否存在“hello”（不分大小写）
$line="Hello,world";
$line=~/hello/i;
print "$&";


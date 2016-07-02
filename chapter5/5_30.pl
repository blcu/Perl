#程序功能：删除字符串头尾空格，替换指定子串，并将所有小写字母转换成大写字母
$_=" hello world,world hello 我们 ";
#去掉头部空格
s/^\s+//;
#去掉尾部空格
s/\s+$//;
print "$_\n";
#把句子中所有单词world替换成Peter
s/world/Peter/g;
#把句子中所有小写字母转换成大写字母
s/(.*)/\U$1/;
print $_;

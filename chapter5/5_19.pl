#程序功能：在含有换行符的$line中，找出以“H”开头以“d”结尾，
#中间含有任意字符的子串
$line="Hello\nworld";
$line=~/H.*d/s;
print $&;

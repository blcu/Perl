#程序功能：“I Love You 9”中字母进行整体替换
$line="I Love You 9";
#将$line中A-I中的字符串替换为[a-i]
$line =~s/[A-I]/[a-i]/; 
print "$line"."\n";

$line="I love you 9";
#将$line中第1个最长的字母字符串替换为字符串“what a”
$line =~s/[A-I]*/what a/; 
print "$line"."\n"; 


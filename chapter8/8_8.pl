use Encode;
$str="我爱perl";
$len=length($str);
print "$len\n";
Encode::_utf8_on($str);
$len=length($str);
print "$len\n";
@chs=$str=~/./g;
$Num=@chs;
print "$Num\n";


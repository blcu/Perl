use Encode;
$astr="Œ“∞ÆPerl”Ô—‘";
print length($astr)."\n";
$bstr=decode("gb2312",$astr);
print length($bstr)."\n";
@arr=$bstr=~/./g;
foreach(@arr){
	print encode("gb2312",$_)." ";
}
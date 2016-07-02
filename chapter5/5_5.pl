$string="aa123567bb";
if($string=~/[^ab]+/){
	print $&;
}

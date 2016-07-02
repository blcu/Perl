$string="[123 abc]";
if($string=~/[^\[\]]+/){
	print $&;
}

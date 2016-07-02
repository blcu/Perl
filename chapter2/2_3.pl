$val=11;
$string="12abc";
if( $val < $string ){
	$val=$string+1;
	print "$val\n";
	$string=$string.$val;
	print "$string";
}


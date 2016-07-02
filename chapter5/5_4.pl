@array=("abc","abbc","1bcd","dbc");
foreach $value(@array){
	if($value=~/[ab12]bc/){
		print "$value:$&\n"; 
	}
	else{
		print "$value:no match\n";
	}
}

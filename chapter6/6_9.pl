
%hash=("a",3,"d",2,"c",4,"b",1);
$refHash=\%hash;
foreach(sort keys %{$refHash}){
	print "$_=>${$refHash}{$_}\n";
}


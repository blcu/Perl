$aString="The deer did not trust us and kept their distance .";
@array=split(" ",$aString);
print $aString. "\n";
foreach $ele(sort @array){
	print $ele." ";
}
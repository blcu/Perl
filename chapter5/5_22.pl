#程序功能：将“I love you”翻译成“I need her”
$line="I love you";                      
if ($line =~tr/I love you/I need her/) { 
	print "$line";                         
}

                                        
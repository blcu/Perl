#一个常用读文件的样例
open(In,"read_file.txt");
while( $line=<In> ){
	chomp($line);
	print $line."\n";	#将文件内容一行一行输出到屏幕上
}
close(In);


#һ�����ö��ļ�������
open(In,"read_file.txt");
while( $line=<In> ){
	chomp($line);
	print $line."\n";	#���ļ�����һ��һ���������Ļ��
}
close(In);


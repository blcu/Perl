#���d:\perl\Ŀ¼�������ļ�
opendir(Dir,"D:\\perl\\");	
@File=readdir(Dir);
foreach $file_name(@File){
	print "$file_name\n";
}
close(Dir); 



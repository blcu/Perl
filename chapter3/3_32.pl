#输出d:\perl\目录下所有文件
opendir(Dir,"D:\\perl\\");	
@File=readdir(Dir);
foreach $file_name(@File){
	print "$file_name\n";
}
close(Dir); 



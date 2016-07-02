use Cwd;	#为了保证平台的兼容性，多使用Cwd来获取当前目录；
$CurrentDir=cwd();  #变量$Current获取当前目录
opendir(Dir,$CurrentDir) || die("error in opendir!");
@files=readdir(Dir);
close(Dir);

open(Out,">out.txt");
foreach(@files){
	if(index($_,".txt") == length($_)-4){
		open(In,$_);
		while(<In>){	
			chomp;
			print Out $_."\n";
		}
		close(In);
	}
}
close(Out);


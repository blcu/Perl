use Cwd;	#Ϊ�˱�֤ƽ̨�ļ����ԣ���ʹ��Cwd����ȡ��ǰĿ¼��
$CurrentDir=cwd();  #����$Current��ȡ��ǰĿ¼
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


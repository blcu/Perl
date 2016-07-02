#取得变量的引用，通过引用访问变量内容
$data="data";
@array=("a","b","c");
%hash=("a",1,"b",2,"c",3);

#在变量名前加“\”，可以取得引用
$refString=\$data;
$refArray=\@array;
$refHash=\%hash;

#"{引用变量}"相当于原变量别名
print ${$refString}."\t";
print ${$refArray}[0]."\t";
print ${$refHash}{"a"};


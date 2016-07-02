
%hash1=("a",1,"b",2,"c",3);  

#获取哈希（%hash1）的引用（$refHash）
$refHash=\%hash1;     

#利用$refHash对%hash2进行赋值
%hash2= %{$refHash };  		

#利用$refHash对哈希成员$hash1{"b"}进行重新赋值
${$refHash}{"b"}=4;

#利用$refHash实现对%hash1中的值$hash1{"a"}和$hash1{"b"}的访问
print ${$refHash}{"a"}."\n"; 
print $hash1{"b"}."\n";


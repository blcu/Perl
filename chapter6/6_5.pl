
$data1="abc";

#获得简单变量（$data1）的一个引用（$ref）
$ref=\$data1;
#利用$ref进行简单变量的赋值操作
$data2=${$ref};
#通过$ref访问$data1的内容，
#并且输出$data1和$data2的内容
print "${$ref}\t$data2\n";

#通过$ref实现对$data1的重新赋值
${$ref}="bc";
print "$data1\t${$ref}\n";


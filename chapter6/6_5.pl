
$data1="abc";

#��ü򵥱�����$data1����һ�����ã�$ref��
$ref=\$data1;
#����$ref���м򵥱����ĸ�ֵ����
$data2=${$ref};
#ͨ��$ref����$data1�����ݣ�
#�������$data1��$data2������
print "${$ref}\t$data2\n";

#ͨ��$refʵ�ֶ�$data1�����¸�ֵ
${$ref}="bc";
print "$data1\t${$ref}\n";

#�����ܣ�ͳ��pos.txt�г��ֵĴʺʹ���
#ʵ��˼�룺��ֵΪ��ϣ�Ĺ�ϣ��װ�ʺͶ�Ӧ����
open(In,"pos.txt");
while($Sent=<In>){
	chomp $Sent;
	@Words=$Sent=~/(\S+)\/\S+/g;
	#�õ�ÿ���ʵĴ���
	@POSs=$Sent=~/\S+\/(\S+)/g;
	#�����ʺʹ��ԣ�����ֵΪ��ϣ�Ĺ�ϣ��%hash��
	for($i=0; $i<@Words; $i++) {
		#���ҵ�ǰ���Ƿ��Ѿ���%hash��
		if(defined $hash{$Words[$i]}) {
			#ȡ��%hash��ֵ����ָ���ӹ�ϣ������
			$refPOS=$hash{$Words[$i]};
			#���ӹ�ϣ����һ������
			${$refPOS}{$POSs[$i]}=1;
		}else{
			#����һ��my���͵��ӹ�ϣ��ָ�������ϣ��������Ϊ%hash��ֵ
			my %posHash=($POSs[$i],1);
			$hash{$Words[$i]}=\%posHash;
		}
  }
}
close(In);

#����%hash
foreach $word(sort keys %hash) {
	print "$word\t";
	$pPOS=$hash{$word};
	foreach $pos(sort keys %{$pPOS}) {
		print "$pos;";
	}
	print "\n";
}

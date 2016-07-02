#构造1个临时整型变量、1个临时字符类型变量
#1个临时数组类型变量和1个临时哈希类型变量
my $val=12;
my $string="data";
my @array=("a","b","c");
my %hash=("a0",11,"b0",12,"c0",13);
@struct=(\$val,\$string,\@array,\%hash);

#输出混合结构中的数据
print ${$struct[0]}."\n";
print ${$struct[1]}."\n";
print $struct[2]->[2]."\n";
print $struct[3]->{"a0"}."\n";
$struct[2]->[3]="d";


#通过引用对混合结构的数组数据进行操作
$pointer=$struct[2];
$pointer->[4]='e';
push(@$pointer,"f");
print "@{$pointer}"."\n";

#通过引用对混合结构的哈希数据进行操作
$pointer=$struct[3];
${$pointer}{e0}='15';
foreach( sort keys %{$struct[3]}){
	print "$_ ";
}
print "\n";

foreach( sort values %{$struct[3]}){
	print "$_ ";
}

main("train.txt","bi.txt");

sub main
{
	my($FileIn,$FileOut)=@_;
	$g_MaxZiNum=1000000;
	BiCount($FileIn,\@BiTmp);
	MergeBi(\@BiTmp,$FileOut);
	foreach (@BiTmp){
			unlink($_);
	}
}

#分治处理函数
sub BiCount
{
	my($File,$refBiTmp)=@_;
	open(In,"$File");
	while($Line=<In>){
		chomp($Line);	
		$Line=decode("gb2312",$Line);
		@HZs=$Line=~/./g;
		unshift(@HZs,$LastHZ);
		for($i=1;$i<@HZs;$i++){
			if( $HZs[$i-1] ne "" ){
				$Bi=$HZs[$i-1]."_".$HZs[$i];
				$Bi=encode("gb2312",$Bi);
				$hashBi{$Bi}++;
				$ZiNum++
			}
			if ( $ZiNum > $g_MaxZiNum ){				
				OutSubBiCount($ID,\%hashBi,$refBiTmp);		
				%hashBi=();
				$ZiNum=0;
				$ID++;
			}
		}
		$LastHZ=$HZs[@HZs-1];
	}
	OutSubBiCount($ID,\%hashBi);		
	close(In);
}

#输出分治结果
sub OutSubBiCount
{
	my($ID,$RefHash,$RefTmp)=@_;
	$BiFileTmp="Tmp_".$ID;
	push(@{$RefTmp},$BiFileTmp);
	print "$BiFileTmp done!\n";
	open(Out,">$BiFileTmp");
	foreach (sort keys %{$RefHash} ){
		print Out "$_\t${$RefHash}{$_}\n";
	}
	close(Out);
}

#合并函数
sub MergeBi
{
	my($RefBiFileList,$Merged)=@_;
	open(Out,">$Merged");	
	foreach (@{$RefBiFileList}){
		$H="F".$_;
		open($H,"$_");
		push(@Fhandle,$H);
	}
	SetHash(\@Fhandle,\%hash);	
	@BiStr=sort keys %hash;
	while( @BiStr > 0 ){
		$Num=0;
		@Fhandle=();
		foreach $Handle(keys %{$hash{$BiStr[0]}} ){
			$Num+=${$hash{$BiStr[0]}}{$Handle};
			push(@Fhandle,$Handle);
		}
		print Out "$BiStr[0]\t$Num\n";
		delete $hash{$BiStr[0]};
		SetHash(\@Fhandle,\%hash);	
		@BiStr=sort keys %hash;
	}
	foreach (@{$RefBiFileList}){
		my $H="F".$_;
		close($H);
	}
}

sub SetHash
{
	my($refHandle,$RefHash)=@_;
	foreach $H(@{$refHandle}){
		if ( <$H>=~/(\S+)\t(\d+)/ ){
			${${$RefHash}{$1}}{$H}=$2;		
		}
	}
}
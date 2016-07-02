main("bi.txt","bi.dat");
sub main
{
	my($FileIn,$FileOut)=@_;
	SetVar("°¡","×ù",1);
	open(In,"$FileIn");
	open (DAT, "+>$FileOut");
	binmode (DAT, ":raw");
	WriteUniBlock();
	while(<In>){
		chomp;
		if( /(\S+)_(\S+)\t(\d+)/){
			$W1=$1;
			$W2=$2;	
			$Count=$3;
			if ( $W1 ne $PreW1 ){
				if( $PreW1 ne "" and $TotalBiCount >0 ){
					$HashUni{$Idx1}=$TotalBiCount;
					$TotalCount+=$TotalBiCount;
					WriteBiBlock();
					print "$PreW1\n";
				}
				$PreW1=$W1;
				$TotalBiCount=0;
				%HashBi=();
			}
			$Idx1=RetHZIdx($W1);
			$Idx2=RetHZIdx($W2);
			if ( $Idx1 >= $MinHZ and $Idx2 >= $MinHZ and $Idx1 <= $MaxHZ and $Idx2 <= $MaxHZ){
				if ( $Count > $THREOLD ){
					$HashBi{$W2}=$Count;
					$TotalBiCount+=$Count;
				}
			}
		}
	}
	WriteBiBlock();
	ReWriteUniBlock();
	close(In);
	close(DAT);
}


sub SetVar
{
	my($FirstHZ,$LastHZ,$Val)=@_;
	$THREOLD=$Val;
	$MinHZ=RetHZIdx($FirstHZ);
	$MaxHZ=RetHZIdx($LastHZ);
}

sub WriteUniBlock
{
	for($i=$MinHZ;$i<=$MaxHZ;$i++){
		print DAT pack("l",0); 
		print DAT pack("f",0.0);
	}
}

sub ReWriteUniBlock
{
	seek(DAT,0,0);
	for($i=$MinHZ;$i<=$MaxHZ;$i++){
		$offset=-1;
		$Val=0.0;
		if ( defined $HashOffset{$i} ){
			$offset=$HashOffset{$i};
			$Val=log($HashUni{$i}/$TotalCount);
		}
		print DAT pack("l",$offset);
		print DAT pack("f",$Val);
	}
}

sub WriteBiBlock
{
		$HashOffset{$Idx1}=tell(DAT);
		$Total=keys %HashBi;
		print DAT pack("l",$Total);
		foreach $hz(sort keys %HashBi){
			$Val=log($HashBi{$hz}/$TotalBiCount);
			print DAT "$hz";
			print DAT pack("f",$Val);
		}

}

sub RetHZIdx
{
	my($HZ)=@_;
	my @HZs=unpack("C*",$HZ);
	$HZIdx=($HZs[0]-0xb0)*94+($HZs[1]-0xa1);
	return $HZIdx;
}
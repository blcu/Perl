main("invert.txt","idx.dat");

sub main
{
	my($InvertTable,$Bigram)=@_;
	SetVar("°¡","×ù",-10e10);
	print "Init PY2HZ Invert table...\n";
	InitPY2HZ($InvertTable);
	print "Init ngram...\n";
	InitNGram($Bigram);
	while (1){
		print "ÊäÈëÆ´Òô(q ÍË³ö)\n>";
		$Inp=<stdin>;
		chomp($Inp);
		if ( $Inp eq "q" ){
			last;
		}
		$IMEResult=IME($Inp);
		print "$IMEResult\n";
	}
}

sub SetVar
{
	my($FirstHZ,$SecondHZ,$MinProb)=@_;
	$g_MinProb=$MinProb;
	$MinHZ=RetHZIdx($FirstHZ);
	$MaxHZ=RetHZIdx($SecondHZ);
}

sub IME
{
	my($Inp)=@_;
	my @Lattice=();
	my $Result;
	Buildlattice($Inp,\@Lattice);
	Search(\@Lattice);
	$Result=Backward(\@Lattice);
	return $Result;
}

sub InitNGram
{
	my($File)=@_;
	open(In,"$File");
	binmode (DAT, ":raw");
	for($i=$MinHZ;$i<=$MaxHZ;$i++){
		read(In,$Val,4);
		$offset=unpack("l",$Val);
		read(In,$Val,4);
		$Uni=unpack("f",$Val);
		$HashOffset{$i}=$offset;
		$HashUni{$i}=$Uni;
	}
	foreach $HZIdx(sort{$a<=>$b} keys %HashOffset){
		if ( $HashOffset{$HZIdx} != -1 ){
			seek(In,$HashOffset{$HZIdx},0);
			read(In,$Val,4);
			$Num=unpack("l",$Val);
			for($i=0;$i<$Num;$i++){
				read(In,$HZ,2);
				read(In,$Val,4);
				$Bi=unpack("f",$Val);
				${$hashBi{$HZIdx}}{$HZ}=$Bi;
			}
		}
	}
	close(In);
}

sub InitPY2HZ
{
	my($File)=@_;
	open(In,"$File");
	while(<In>){
		chomp;
		if(/(\S+) (.*)/){
			$PY=$1;
			$HZ=$2;
			my @HZs=$HZ=~/\S+/g;
			$hashPy2HZ{$PY}=\@HZs;
		}
	}
	close(In);
}

sub RetHZIdx
{
	my($HZ)=@_;
	my @HZs=unpack("C*",$HZ);
	$HZIdx=($HZs[0]-0xb0)*94+($HZs[1]-0xa1);
	return $HZIdx;
}

sub GetProb
{
	my($HZ1,$HZ2)=@_;
	if ($HZ1 eq "BEG" ){
		$Val=GetUni($HZ2);
	}elsif ($HZ2 eq "END" ){
		$Val=0.0;
	}else{
		$Val=GetBi($HZ1,$HZ2);
	}
	return $Val;
}

sub GetUni
{
	my($HZ)=@_;
	$Id=RetHZIdx($HZ);
	if ( $MinHZ > $Id or $MaxHZ < $Id ){
		return $g_MinProb;
	}
	unless ( defined $HashUni{$Id} ){
		return $g_MinProb;
	}
	return $HashUni{$Id};
}

sub GetBi
{
	my($HZ1,$HZ2)=@_;
	$Id1=RetHZIdx($HZ1);
	$Id2=RetHZIdx($HZ2);
	if ( $MinHZ > $Id1 or $MaxHZ < $Id1 or  $MinHZ > $Id2 or $MaxHZ < $Id2  ){
		return $g_MinProb;
	}
	unless ( defined $hashBi{$Id1} ){
		return $g_MinProb;
	}
	unless ( defined ${$hashBi{$Id1}}{$HZ2} ){
		return $g_MinProb;
	}
	return ${$hashBi{$Id1}}{$HZ2};
}

sub Buildlattice
{
	my($Inp,$RefLattice)=@_;
	@Pys=split(" ",$Inp);
	unshift(@Pys,"BEG");
	push(@Pys,"END");
	for($i=0;$i<@Pys;$i++){
		my @OneColumn=();
		@Candidate=();
		GetAllCandidate($Pys[$i],\@Candidate);
		foreach (@Candidate){
			my @OneUnit=();
			$OneUnit[0]=$_;	
			$OneUnit[1]=0;	
			$OneUnit[2]=0;
			push(@OneColumn,\@OneUnit);
		}
		push(@{$RefLattice},\@OneColumn);
	}
}

sub		GetAllCandidate
{
	my($PY,$refcandidate)=@_;
	if ( defined $hashPy2HZ{$PY} ){
			$RefHZ=$hashPy2HZ{$PY};
			push(@{$refcandidate},@{$RefHZ});
  }
}

sub Search
{
	my($RefLattich)=@_;
	for($i=1;$i<@{$RefLattich};$i++){
		$RefCurrent=${$RefLattich}[$i];
		$RefPrevious=${$RefLattich}[$i-1];
		foreach $RefCurHZ(@{$RefCurrent}){
			$Max=-1e1000;
			$Num=0;
			foreach $RefPrevHZ(@$RefPrevious){
				$Val=GetProb(${$RefPrevHZ}[0],${$RefCurHZ}[0])+${$RefPrevHZ}[1];
				if ( $Val > $Max){
					$Max=$Val;
					$MaxProb=$Num;
				}
				$Num++;
			}
			${$RefCurHZ}[1]=$Max;
		  ${$RefCurHZ}[2]=${$RefPrevious}[$MaxProb];
		}
	}	
}


sub Backward
{
	my ($RefLattich)=@_;
  my $RefEnd=${$RefLattich}[@$RefLattich-1];
  $BackPointer=${${$RefEnd}[0]}[2];
	my @ResultArray;
	while( ${$BackPointer}[2] != 0 ){
		$Pair=${$BackPointer}[0];
		unshift(@ResultArray,$Pair);
		$BackPointer=${$BackPointer}[2];
	}
	my $Result=join(" ",@ResultArray);
	return $Result;
}
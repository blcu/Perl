use Win32::ODBC; 
$DSN = "url"; 

#连接数据库 
if (!($db = new Win32::ODBC($DSN))){ 
	print "Fail to connect database!\n"; 
	exit(); 
} 
open(In,"URLList.txt");
while( true ){
	chomp;
	GetURLInfo(In,\$ID,\$Url) ;
	if( $ID ne "" and $Url ne ""){
		$sql="insert into urllist(ID,URL) values ($ID,\'$Url\')"; 
		$db->Sql($sql); 
	}else{
		last;
	}
}
$db->Close();   
close(In);


sub GetURLInfo
{
	my($In,$refID,$refURL)=@_;
	${$refID}="";
	${$refURL}="";
	if ( <$In>=~/^#(.*)/ ){
		${$refID}=$1;
	}
	if ( <$In>=~/^URL:(.*)/ ){
		${$refURL}=$1;		
	}
}
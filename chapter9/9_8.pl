use DBI; 

$dsn="DBI:mysql:url:localhost"; 
$opt_user="root"; 
$opt_password="star2008";
$table="urllist"; 
$dbh = DBI->connect($dsn,$opt_user,$opt_password,{RaiseError => 1}); 

open(In,"URLList.txt");
while( true ){
	chomp;
	GetURLInfo(In,\$ID,\$Url) ;
	if( $ID ne "" and $Url ne ""){
		 $dbh->do(qq{
	      INSERT INTO $table VALUES ('$ID','$Url')
	    });
	    
	}else{
		last;
	}
}
$dbh->disconnect;


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
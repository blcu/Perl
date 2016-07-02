use DBI; 

$dsn="DBI:mysql:url:localhost"; 
$opt_user="root"; 
$opt_password="root";
$table="urllist"; 

$dbh = DBI->connect($dsn,$opt_user,$opt_password,{RaiseError => 1}); 

$Sql="select * from $table";
$sth=$dbh->prepare($Sql);
$sth->execute(); 
while ( (@row = $sth->fetchrow_array)){
	print "@row\n"; 
}
$sth->finish();
$dbh->disconnect;
use Win32::ODBC; 
$DSN = "url"; 

#连接数据库 
if (!($db = new Win32::ODBC($DSN))){ 
	print "Fail to connect database!\n"; 
	exit(); 
} 

#数据库中的表 
print "Table:\n"; 
@tables = $db->TableList; 
$Inof=join("\t",@tables);
print $Inof,"\n"; 


$sql="select * from urllist"; 
if($db->Sql($sql)){ 
	print "error select data\n"; 
	Win32::ODBC->DumpError(); 
	$db->Close(); 
	exit(); 
} 

@FieldNames = $db->FieldNames();
print "Field Names:\n";
$Inof=join("\t",@FieldNames);
print $Inof,"\n"; 

while($db->FetchRow()){ 
	%row=$db->DataHash; 
	foreach (@FieldNames){
		print $row{$_},"\t";
	}
	print "\n";
} 
$db->Close();   
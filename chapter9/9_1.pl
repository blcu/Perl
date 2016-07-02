use Lingua::MSWordSpell;
$spchecker = new Lingua::MSWordSpell;

#输入要检查的文本
@errors = $spchecker->spellcheck("the niice person is a suppper man");
#输出检查结果
foreach (@errors){
	print "${$_}{term} @{${$_}{guesses}}  ${$_}{offset}\n";
}




use Lingua::MSWordSpell;
$spchecker = new Lingua::MSWordSpell;

#����Ҫ�����ı�
@errors = $spchecker->spellcheck("the niice person is a suppper man");
#��������
foreach (@errors){
	print "${$_}{term} @{${$_}{guesses}}  ${$_}{offset}\n";
}



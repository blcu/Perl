#程序功能：从html中，过滤掉所有html标记，取得所有文本信息及链接
use LWP::Simple;
use HTML::Parser;
#给定要过滤的url
my $url = "http://nlp.blcu.edu.cn";
#通过调用LWP::Simple模块中的get()来获得url所指向的那个网址的网页
my $content = LWP::Simple::get($url);
my $parser = HTML::Parser->new(api_version => 3,
			start_h => [\&start, "tagname, attr, '+1'"],
			text_h =>  [\&text, "text"],
			end_h =>   [\&end, "tagname, attr, '-1'"],
			comment_h => [""],
			default_h => [""],);			
$parser->parse($content);

sub start {
	my ($tag, $attr,$num) = @_;	
	$inside{$tag} += $num; 

	if ($tag =~ /^a$/ and defined $attr->{'href'}) {
		#取得网页中所有链接，如果不需要这个功能，去掉第19~23行代码
		print "$attr->{'href'}\n";
		return;
	}
}
sub end {
	my ($tag, $attr,$num) = @_;	
	$inside{$tag} += $num; 
}

sub text {
	my ($text) = @_;
	if ( $inside{"script"} || $inside{"style"} ){
		return;
	} 
	$text =~ s/&nbsp\;/ /g;
	#取得网页中的文字，如果不需要这个功能，去掉第35~37行代码
	print $text;
	return;
}
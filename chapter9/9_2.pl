use HTTP::Request;
use LWP::UserAgent;
#给定要抓取的URL
$Website='http://nlp.blcu.edu.cn/';
#所谓new就是建立一个拥有模块功能的对象。这里就是
#建立了一个拥有LWP各种功能的对象，它的名字叫ua
$ua=new LWP::UserAgent();
$request=new HTTP::Request('GET',$Website);
$response=$ua->request($request);
$str=$response->content;
Encode::_utf8_on($str);
print encode("gb2312",$str);

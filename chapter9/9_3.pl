use HTTP::Request::Common;
use LWP::UserAgent;
$ua=new LWP::UserAgent();
#最大允许延迟时间
$ua->timeout(100);
#下载文件的URL
$url="http://nlp.blcu.edu.cn/downloads/HZFreq.zip";
#保存本地文件名
$filespec="downloaded.zip";
$response = $ua->request(GET($url),$filespec);


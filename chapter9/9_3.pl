use HTTP::Request::Common;
use LWP::UserAgent;
$ua=new LWP::UserAgent();
#��������ӳ�ʱ��
$ua->timeout(100);
#�����ļ���URL
$url="http://nlp.blcu.edu.cn/downloads/HZFreq.zip";
#���汾���ļ���
$filespec="downloaded.zip";
$response = $ua->request(GET($url),$filespec);

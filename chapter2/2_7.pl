$Val = int(rand(100));
print "\n得分：$Val\n";
print "成绩状态：";
if ( $Val<60 )
{
  print "不及格";
}
elsif ( $Val<80 )
{
  print "及格";
}
else
{
  print "优秀";
}
print "\n";
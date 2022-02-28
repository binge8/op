#!/bin/bash
if [ "$compile" = "success" ] || [ "$organize" = "success" ] || [ "$PACKAGED_STATUS" = "success" ];then
  curl -H "Content-Type:application/json" -X POST -d '{"token":"$pushbot","title":"Actions云编译-$FILE_NAME成功","content":"$FILE_NAME发布成功","template":"json"}' http://www.pushplus.plus/send
else
  curl -H "Content-Type:application/json" -X POST -d '{"token":"$pushbot","title":"Actions云编译-$FILE_NAME失败","content":"$FILE_NAME发布失败","template":"json"}' http://www.pushplus.plus/send
fi

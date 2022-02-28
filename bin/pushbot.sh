#!/bin/bash
if [[ "${{ env.compile }}" = "success" ]] || [[ "${{ env.organize }}" = "success" ]] || [[ "${{ env.PACKAGED_STATUS }}" = "success" ]];then
  curl -H "Content-Type:application/json" -X POST -d '{"token":"${{ env.pushbot }}","title":"Actions云编译-${{ env.FILE_NAME }}成功","content":"${{ env.FILE_NAME }}发布成功","template":"json"}' http://www.pushplus.plus/send
else
  curl -H "Content-Type:application/json" -X POST -d '{"token":"${{ env.pushbot }}","title":"Actions云编译-${{ env.FILE_NAME }}失败","content":"${{ env.FILE_NAME }}发布失败","template":"json"}' http://www.pushplus.plus/send
fi
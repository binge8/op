import os
import requests

corpid = os.getenv("WECOM_CORPID")
corpsecret = os.getenv("WECOM_CORPSECRET")
agentid = os.getenv("WECOM_AGENTID")
touser = os.getenv("WECOM_TOUSER", "@all")
content = os.getenv("WECOM_CONTENT", "GitHub Action 通知")
proxy = os.getenv("HTTPS_PROXY")  # 代理设置（可选）

# 获取 access_token
token_url = f"https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid={corpid}&corpsecret={corpsecret}"
try:
    response = requests.get(token_url, proxies={"https": proxy} if proxy else None)
    access_token = response.json().get("access_token")
except Exception as e:
    print(f"❌ 获取 access_token 失败: {e}")
    exit(1)

# 发送消息
send_url = f"https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={access_token}"
data = {
    "touser": touser,
    "msgtype": "text",
    "agentid": agentid,
    "text": {"content": content},
    "safe": 0
}
try:
    res = requests.post(send_url, json=data, proxies={"https": proxy} if proxy else None)
    if res.json().get("errcode") != 0:
        print(f"❌ 消息发送失败: {res.text}")
        exit(1)
    print("✅ 企业微信通知发送成功！")
except Exception as e:
    print(f"❌ 消息发送异常: {e}")
    exit(1)

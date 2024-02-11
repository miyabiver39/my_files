import psutil # pip install psutil
import requests
import os

# ネットワーク情報の取得
net_io = psutil.net_io_counters()
bytes_sent = net_io.bytes_sent / (1024 * 1024)  # MB単位で変換
bytes_recv = net_io.bytes_recv / (1024 * 1024)  # MB単位で変換

# 稼働時間の取得
uptime_seconds = int(float(os.popen('cat /proc/uptime').read().split()[0]))
uptime_hours = uptime_seconds // 3600

# プロセス数の取得
process_count = len(psutil.pids())

# システム負荷の取得
load1, load5, load15 = os.getloadavg()

# メッセージの更新
message = {
    "content": None,
    "embeds": [
        {
            "title": "Ubuntu Server Resource Status - Detailed",
            "description": "Detailed current system resource status.",
            "color": 5814783,
            "fields": [
                {"name": "CPU Usage", "value": f"{psutil.cpu_percent()}%", "inline": True},
                {"name": "Memory Usage", "value": f"{psutil.virtual_memory().percent}%", "inline": True},
                {"name": "Disk Usage", "value": f"{psutil.disk_usage('/').percent}% on /", "inline": True},
                {"name": "Network Sent", "value": f"{bytes_sent:.2f} MB", "inline": True},
                {"name": "Network Received", "value": f"{bytes_recv:.2f} MB", "inline": True},
                {"name": "Uptime", "value": f"{uptime_hours} hours", "inline": True},
                {"name": "Process Count", "value": f"{process_count}", "inline": True},
                {"name": "System Load", "value": f"1 min: {load1}, 5 min: {load5}, 15 min: {load15}", "inline": False},
            ],
        }
    ],
}

# Discord Webhook URL (あなたのWebhook URLを設定してください)
webhook_url = 'http://example.com'

# メッセージをDiscordに送信
response = requests.post(webhook_url, json=message)
if response.status_code == 204:
    print("Successfully sent the message to Discord!")
else:
    print(f"Failed to send message to Discord. Status code: {response.status_code}")




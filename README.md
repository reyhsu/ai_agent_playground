# How to use
將 code 放到 /app 目錄內，或是空目錄也可以，讓 AI Agent 的產出存到 /app

用 docker container 啟動 AI Agent，並掛載本地的的目錄 /app 到 container 內的 /app，實現環境隔離避免污染字的的作業系統

### 啟動指令直接輸入下列指令
```
docker compose up -d --build
```

### 停用/刪除，docker container
```
docker compose down
```

### 進入 agy cli 對談視窗
```
docker exec -ti agy-cli /root/.local/bin/agy --dangerously-skip-permissions
```
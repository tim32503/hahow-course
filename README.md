# 系統需求

- Ruby 3.2.2
- Rails 7.1.3
- Postgresql

# 操作說明

## 本機端

1. 下載此專案後，請先依序執行下列指令
  ```
  bundle install
  rails db:create
  rails db:migrate
  rails s
  ```
2. 接著進入 http://localhost:3000/graphiql ，我們可透過此頁面來測試 API。

## API 測試

### 課程列表
提供使用者取得系統中所有「課程」的資訊，其中包含課程中的「章節」資訊和「單元」資訊。

將下方程式碼貼至 GraphiQL 頁面中白色區塊後執行，即可得到完整課程資訊。
```GraphQL
{
  courses {
    id
    name
    lecturerName
    description
    chapters {
      id
      name
      units {
        id
        name
      }
    }
  }
}

```

# 題目

- [ ] 我們該如何執行這個 server
- [ ] 專案的架構，API server 的架構邏輯
- [ ] 你對於使用到的第三方 Gem 的理解，以及他們的功能簡介
- [ ] 你在程式碼中寫註解的原則，遇到什麼狀況會寫註解
- [ ] 當有多種實作方式時，請說明為什麼你會選擇此種方式
- [ ] 在這份專案中你遇到的困難、問題，以及解決的方法

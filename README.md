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
        description
        content
      }
    }
  }
}

```

### 特定課程詳細資訊
提供使用者取得指定「課程」的資訊，其中包含課程中的「章節」資訊和「單元」資訊。

將下方程式碼貼至 GraphiQL 頁面中白色區塊後執行，即可得到完整課程資訊。
```GraphQL
{
  course(id: 1) {
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
        description
        content
      }
    }
  }
}

```

### 建立課程

請設計一個 API 提供使用者建立「課程」與課程中的「章節」和「單元」。

- [ ] 「課程」、「章節」和「單元」需要同時被建立
- [ ] 需要驗證使用者的輸入並在儲存失敗時回傳錯誤訊息
- [ ] 需要儲存「章節」和「單元」的順序

```
mutation add{
  createCourse(input: {
		input: {
      name: "課堂 4",
			lecturerName: "Hahow",
      chapters: [
        {
          name: "課堂 4 的章節 1",
          units: [
            {
              name: "課堂 4 - 章節 1 - 單元 1",
              content: "課堂 4 - 章節 1 - 單元 2"
            }
          ]
        }
      ]
    }
  }){
    course {
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
          description
          content
        }
      }
    }
  }
}
```

### 編輯課程

請設計一個 API 提供使用者編輯「課程」與課程中的「章節」和「單元」。

- [ ] 需要驗證使用者的輸入並在儲存失敗時回傳錯誤訊息
- [ ] 「章節」和「單元」的順序都可以被調整

```
mutation {
  updateCourse(input: {
		input: {
      id: 5,
      name: "課堂 4 (修改後)",
			lecturerName: "Hahow",
      chapters: [
        {
          id: 6,
          name: "課堂 4 的章節 1 (測試)",
          units: [
            {
              id: 8,
              name: "課堂 4 - 章節 1 - 單元 1（修改後的修改後）",
              content: "這堂我們不上課！"
            }
          ]
        }
      ]
    }
  }){
    course {
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
          description
          content
        }
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

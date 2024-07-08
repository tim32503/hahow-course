# 系統需求

- Ruby 3.2.2
- Rails 7.1.3
- Postgresql

# 操作說明

## 正式環境

1. 直接進入 https://hahow-api.fly.dev/graphiql 此頁面
2. 依序參照下方 [API 測試](#api-測試) 的程式碼區塊複製、貼上、執行，即可嘗試呼叫對應的 API

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
      sequence
      units {
        id
        name
        description
        content
        sequence
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
      sequence
      units {
        id
        name
        description
        content
        sequence
      }
    }
  }
}
```

### 建立課程

請設計一個 API 提供使用者建立「課程」與課程中的「章節」和「單元」。

- [x] 「課程」、「章節」和「單元」需要同時被建立
- [x] 需要驗證使用者的輸入並在儲存失敗時回傳錯誤訊息
- [x] 需要儲存「章節」和「單元」的順序

```
mutation {
  createCourse(input: {
		input: {
      name: "課堂 4",
			lecturerName: "Hahow",
      chapters: [
        {
          name: "課堂 4 的章節 1",
          sequence: 2
          units: [
            {
              name: "課堂 4 - 章節 1 - 單元 2",
              content: "課堂 4 - 章節 1 - 單元 2",
              sequence: 5
            },
            {
              name: "課堂 4 - 章節 1 - 單元 1",
              content: "課堂 4 - 章節 1 - 單元 1",
              sequence: 3
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
        sequence
        units {
          id
          name
          description
          content
          sequence
        }
      }
    }
  }
}
```

### 編輯課程

請設計一個 API 提供使用者編輯「課程」與課程中的「章節」和「單元」。

- [x] 需要驗證使用者的輸入並在儲存失敗時回傳錯誤訊息
- [x] 「章節」和「單元」的順序都可以被調整

```
mutation {
  updateCourse(input: {
		input: {
      id: 3,
      name: "課堂 4 (修改後)",
			lecturerName: "Hahow",
      chapters: [
        {
          id: 4,
          name: "課堂 4 的章節 1 (測試)",
          sequence: 10
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
        sequence
        units {
          id
          name
          description
          content
          sequence
        }
      }
    }
  }
}
```

### 刪除課程

請設計一個 API 提供使用者刪除指定的「課程」。

- [x] 當「課程」被刪除時，「課程」中的「章節」和「單元」也應該同時被刪除。
- [x] 當「課程」刪除失敗時，需要回傳錯誤訊息

```
mutation {
  deleteCourse(input: {
    id: 5
  }) {
    success
    errors
  }
}
```


# 專案架構？

1. 由於此專案僅供簡易測試用，故選擇跳過

# FAQ

## 我們該如何執行這個 server
可參考 [操作說明](#操作說明) 的方式去執行！

## 你對於使用到的第三方 Gem 的理解，以及他們的功能簡介

### graphql
這是一個用 Ruby 實作 GraphQL 架構的 Gem，我目前對它的理解是主要會透過 `graphql#execute` 作為 API 的進入點後去執行各項邏輯處理。

### graphiql-rails
這個 Gem 可以在瀏覽器中產生一個互動式介面，方便使用者操作去直接撰寫、執行和檢查 GraphQL 查詢和 mutations，可以提高開發及測試的效率！

### factory_bot_rails
這個 Gem 可以方便地建立各種測試資料，以利開發者在撰寫測試程式時，能更快速地產生測試資料，提高測試的可維護性。

### faker
可以透過此 Gem 來亂數產生任何模擬用的資料內容，這與 factory_bot_rails 結合使用後，能使測試資料有更高的可讀性。

### rspec-rails
Rails 中有各種撰寫測試用的套件，而 RSpec 則是最為耳熟能詳的一套架構，這次專案的測試便是以 RSpec 來去撰寫。

### shoulda-matchers
這個 Gem 主要使用在測試 Rails 的 Model & Controller，它可用來測試包括驗證器、關聯性等等，且使用後能讓測試寫起來更加精簡易讀。

## 你在程式碼中寫註解的原則，遇到什麼狀況會寫註解
1. 當有特殊目的時，會將其原因用註解方式直接在程式中紀錄，方便其他開發人員在閱讀到該段程式時，能更直接地知道原因。
2. 當程式碼過多、較為冗長時，會適時地透過註解來分類不同段落的程式碼。簡單的註解描述讓他人能得以更快速在整頁程式碼中找到所需編輯的段落。

## 當有多種實作方式時，請說明為什麼你會選擇此種方式
在選擇實作方式之前，會先去評估多種實作方式的可行性及優缺點為何。評估過後，再依照當下的情境、資源等因素，去評斷哪種實作方式會是相對好的選擇。

## 在這份專案中你遇到的困難、問題，以及解決的方法
在撰寫這份專案的過程中，主要遇到最大的困難是自己不曾有過 GraphQL API 的經驗。

雖然說題目中有提及覺得有把握的話再用即可，但我考量到因 Hahow 本身在專案中就是使用 GraphQL 架構，不妨讓自己藉由這次徵才專案的機會來挑戰看看，至少也能對於 GraphQL 有初步認識。

為了讓自己能順利開發出 GraphQL API，同時也考慮到製作專案的時間限制，我主要選擇使用 ChatGPT 來幫我整理 GraphQL API 的相關資料，讓我大幅省去爬遍各大網站及整理資料的時間。

學習的過程不外乎就是吸收、內化到產出，所以閱讀過 ChatGPT 彙整過後的資料後，我便透過 try and error 的方式不斷嘗試，去確認自己理解的對不對。

到最後，能成功完成這整份專案，雖然不敢說自己理解程度有到 100 分，但我想應該也有 60 分吧！至少透過這次的專案經驗，我對 GraphQL API 開始產生了興趣，剩餘不足、不懂的部分，後續再來安排時間幫自己加強、精進。

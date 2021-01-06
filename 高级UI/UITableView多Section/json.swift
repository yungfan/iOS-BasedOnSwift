let str = """
[
  {
    "时间": "2021/1/3 0:00:00",
    "金额": 150,
    "明细": [
      {
        "id": 21,
        "事项": "早饭",
        "金额": 70
      },
      {
        "id": 22,
        "事项": "午饭",
        "金额": 80
      }
    ]
  },
  {
    "时间": "2021/1/2 0:00:00",
    "金额": 150,
    "明细": [
      {
        "id": 18,
        "事项": "早饭",
        "金额": 40
      },
      {
        "id": 19,
        "事项": "午饭",
        "金额": 50
      },
      {
        "id": 20,
        "事项": "晚饭",
        "金额": 60
      }
    ]
  },
  {
    "时间": "2021/1/1 0:00:00",
    "金额": 61.5,
    "明细": [
      {
        "id": 15,
        "事项": "早饭",
        "金额": 10.5
      },
      {
        "id": 16,
        "事项": "午饭",
        "金额": 20.5
      },
      {
        "id": 17,
        "事项": "晚饭",
        "金额": 30.5
      }
    ]
  }
]
"""

// MARK: - ModelElement
struct ModelElement: Codable {
    let 时间: String
    let 金额: Double
    let 明细: [明细]
}

// MARK: - 明细
struct 明细: Codable {
    let id: Int
    let 事项: String
    let 金额: Double
}


let decoder = JSONDecoder()

if let models = try? decoder.decode([ModelElement].self, from: str.data(using: .utf8)!) {
    print(models.count)
}

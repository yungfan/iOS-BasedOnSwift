//
//  DBTools.swift
//  SQLite操作
//
//  Created by 杨帆 on 2018/12/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import Foundation
import SQLite

struct DBTools {
    /// 数据库路径
    let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/person.db"

    var db: Connection!

    let personTable = Table("t_person") // 表名
    let personID = Expression<Int>("id") // id
    let personName = Expression<String>("name") // name
    let personPhone = Expression<String>("phone") // phone
    let personAddress = Expression<String>("address") // address

    // MARK: - 构造函数，数据库有则连接 没有就创建后连接

    init() {
        do {
            try db = Connection(dbPath)

            print("数据库创建/连接成功")
        } catch {
            print("数据库创建/连接失败")
        }
    }

    // MARK: - 创建表格，表若存在不会再次创建，直接进入catch

    func createTable() {
        do {
            try db.run(personTable.create(block: { t in

                t.column(personID, primaryKey: .autoincrement)
                t.column(personName)
                t.column(personPhone)
                t.column(personAddress)

            }))

            print("数据表创建成功")
        } catch {
            print("数据表创建失败")
        }
    }

    // MARK: - 插入数据

    func insertPerson(person: Person) {
        let insert = personTable.insert(personName <- person.name, personPhone <- person.phone, personAddress <- person.address)

        do {
            try db.run(insert)
            print("插入数据成功")
        } catch {
            print("插入数据失败")
        }
    }

    // MARK: - 根据name删除数据

    func deletePerson(name: String) {
        // 刷选数据
        let p = personTable.filter(personName == name)

        do {
            let row = try db.run(p.delete())

            if row == 0 {
                print("暂无数据删除")
            } else {
                print("数据删除成功")
            }
        } catch {
            print("删除数据失败")
        }
    }

    // MARK: - 更新数据

    func updatePerson(person: Person) {
        // 刷选数据
        let p = personTable.filter(personName == person.name)

        do {
            let row = try db.run(p.update(personPhone <- person.phone, personAddress <- person.address))

            if row == 0 {
                print("暂无数据更新")
            } else {
                print("数据更新成功")
            }

        } catch {
            print("数据更新失败")
        }
    }

    // MARK: - 查询数据

    func selectPerson() -> [Person]? {
        // 将查询的结果保存
        var response: [Person] = []

        do {
            let select = try db.prepare(personTable)

            for person in select {
                let p = Person(name: person[personName], phone: person[personPhone], address: person[personAddress])

                response.append(p)
            }

            if !response.isEmpty {
                print("数据查询成功")
            } else {
                print("对不起，暂无数据")
            }

            return response

        } catch {
            print("数据查询失败")

            return nil
        }
    }
}

//
//  StudentOp.swift
//  CoreDataDemo
//
//  Created by 杨帆 on 2020/8/3.
//

import CoreData
import Foundation

class StudentOp {
    var students: [Student] = []

    let cdm = CoreDataManager.shared

    func insert() {
        for index in 0 ..< 5 {
            let stu = Student(context: cdm.moc) // 注意创建方式
            stu.name = "zhangsan\(index)"
            stu.age = 10

            if index % 2 == 0 {
                stu.sex = "male"
            } else {
                stu.sex = "female"
            }

            cdm.saveContext()
        }
        
        queryAll()
    }

    func queryAll() {
        let request = Student.fetchRequest() as NSFetchRequest
        // request.fetchLimit = 3
        do {
            try students = cdm.moc.fetch(request)
        } catch {
            print("query error")
        }
        
        print("---------start---------")
        
        for stu in students {
            print(stu.name!)
        }
        
        print("---------end---------")
    }

    func update() {
        queryAll()
        let stu = students.first
        if let stu = stu {
            stu.name = "lisi"
            cdm.saveContext()
        }
        
        queryAll()
    }

    func delete() {
        queryAll()
        let stu = students.first
        if let stu = stu {
            cdm.moc.delete(stu)
        }
        
        queryAll()
    }
    
    func clear() {
        queryAll()
        for stu in students {
            cdm.moc.delete(stu)
        }
        
        queryAll()
    }
}

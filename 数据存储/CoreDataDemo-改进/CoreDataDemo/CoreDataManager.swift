//
//  CoreDataManager.swift
//  CoreDataDemo
//
//  Created by 杨帆 on 2020/8/3.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()

    let app = UIApplication.shared.delegate as! AppDelegate

    lazy var moc: NSManagedObjectContext = {
        app.persistentContainer.viewContext
    }()

    func saveContext() {
        app.saveContext()
    }
}

//
//  AppDelegate.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 31.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        insertGroupData()
        
        return true
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "GroupModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //MARK: - Insert Data from group.plist
    func insertGroupData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetch: NSFetchRequest<GroupMO> = GroupMO.fetchRequest()
        fetch.predicate = NSPredicate(format: "groupName != nil")
        
        let count = try! context.count(for: fetch)
        
        if count > 0 {
            // SampleData.plist data already in Core Data
            return
        }
        
        let path = Bundle.main.path(forResource: "GroupData", ofType: "plist")!
        let dataArray = NSArray(contentsOfFile: path)!
        
        for dict in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Group", in: context)!
            let group = GroupMO(entity: entity,
                                insertInto: context)
            let groupDict = dict as! [String : Any]
            
            group.groupName = groupDict["groupName"] as? String
            group.groupTopic = groupDict["groupTopic"] as? String
            group.groupImageName = groupDict["groupImageName"] as? String
        }
        try! context.save()
    }
    
    // MARK: - Core Data Saving support
    
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


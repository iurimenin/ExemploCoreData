//
//  ViewController.swift
//  ExemploCoreData
//
//  Created by Iuri Menin on 05/08/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
//        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
//        newUser.setValue("Iuri M", forKey: "username")
//        newUser.setValue("123456", forKey: "password")
//        
//        do {
//            try context.save()
//        } catch {
//            print("Ocorreu um erro ao salvar")
//        }
        
        let requests = NSFetchRequest(entityName: "Users")
        requests.returnsObjectsAsFaults = false
        requests.predicate = NSPredicate(format: "username = %@", "Iuri")
        
        do {
            let results = try context.executeFetchRequest(requests)
            
            if results.count > 0 {
                for result in results{
                    
                    if let _ = result.valueForKey("username") {
                    
                        //result.setValue("iuri", forKey: "username")
                        do {
                            try context.save()
                        } catch {
                            print("Ocorreu um erro ao salvar")
                        }
                        
                        print(result.valueForKey("username"))
                    }
                }
            }
        } catch {
            print("Erro recuperando usuarios")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


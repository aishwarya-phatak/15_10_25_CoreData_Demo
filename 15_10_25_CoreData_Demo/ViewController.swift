//
//  ViewController.swift
//  15_10_25_CoreData_Demo
//
//  Created by Vishal Jagtap on 29/01/26.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insertEmployeeRecords()
    }
    
    func insertEmployeeRecords(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let employeeEntity = NSEntityDescription.entity(forEntityName: "Employee",
                                                        in: managedContext)
        
        let employeeManagedObject1 = NSManagedObject(entity: employeeEntity!,
                                                     insertInto: managedContext)
        
        employeeManagedObject1.setValue(12932, forKey: "empId")
        employeeManagedObject1.setValue("Preethi", forKey: "empName")
        employeeManagedObject1.setValue("Pune", forKey: "empCity")
        
        let employeeManagedObject2 = NSManagedObject(entity: employeeEntity!, insertInto: managedContext)
        
        employeeManagedObject2.setValue(34261, forKey: "empId")
        employeeManagedObject2.setValue("Monali", forKey: "empName")
        employeeManagedObject2.setValue("Pune", forKey: "empCity")
        
        let employeeManagedObject3 = NSManagedObject(entity: employeeEntity!, insertInto: managedContext)
        employeeManagedObject3.setValue(56392, forKey: "empId")
        employeeManagedObject3.setValue("Sujata", forKey: "empName")
        employeeManagedObject3.setValue("Pune", forKey: "empCity")
        
        do{
            try managedContext.save()
        }catch{
            print(error)
        }
    }
}

//
//  ViewController.swift
//  15_10_25_CoreData_Demo
//
//  Created by Vishal Jagtap on 29/01/26.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pathForCoreData = appDelegate.persistentContainer.persistentStoreDescriptions.first?.url
        print(pathForCoreData)
//        insertEmployeeRecords()
        retriveEmployeeRecords()
//        deleteEmployeeRecords()
//        retriveEmployeeRecords()
        updateEmployeeRecords()
        retriveEmployeeRecords()
    }
    
    func insertEmployeeRecords(){
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
    
    func retriveEmployeeRecords(){
       
        let managedContext = appDelegate.persistentContainer.viewContext

        let employeeEntity = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
    
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        fetchRequest.entity = employeeEntity
        
        do{
            let fetchedEmployeeRecords = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for i in 0...fetchedEmployeeRecords.count - 1{
                let eachEmployee = fetchedEmployeeRecords[i]
                print(eachEmployee)
            }
        }catch{
            print(error)
        }
    }
    
    func deleteEmployeeRecords(){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let employeeEntity = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")

        fetchRequest.entity = employeeEntity
        
        let predicateEmpId = NSPredicate(format: "empId = %@", NSNumber(integerLiteral: 12932))         //important
        fetchRequest.predicate = predicateEmpId
        
        print(fetchRequest.description)
        
        do{
            let fetchRequestResults = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for i in 0...fetchRequestResults.count - 1{
                let objectToBeDeleted = fetchRequestResults[i]
                managedContext.delete(objectToBeDeleted)
            }
        }catch{
            print(error)
        }
        
        do{
            try managedContext.save()
        }catch{
            print(error)
        }
    }
    
    func updateEmployeeRecords(){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let employeeEntity = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        fetchRequest.entity = employeeEntity
        
        let employeeUpdationPredicate = NSPredicate(format: "empId = %@", NSNumber(integerLiteral:56392))
        
        fetchRequest.predicate = employeeUpdationPredicate
        
        do{
            let fetchedResults = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for i in 0...fetchedResults.count - 1{
                let objectToBeUpdated = fetchedResults[i]
                print(objectToBeUpdated)
                objectToBeUpdated.setValue(67543, forKey: "empId")
                objectToBeUpdated.setValue("Tanishka", forKey: "empName")
                objectToBeUpdated.setValue("Mumbai", forKey: "empCity")
            }
        }catch{
            
        }
        
        do{
            try managedContext.save()
        }catch{
            print(error)
        }
    }
}

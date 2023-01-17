//
//  ViewController.swift
//  CoreDataExmple
//
//  Created by Namik Karabiyik on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {
    var viewContext =
    {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        var viewContext = appDelegate.persistentContainer.viewContext
        return viewContext
    }()

    
    var items: [Person]?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.addWithAlert()
        }
       
    }
    
    func fetchPeople()
    {
        do
        {
            try self.items = viewContext.fetch(Person.fetchRequest())
            print(items)
        }catch
        {
            print("er bur")
        }
    }
    func addWithAlert()
    {
        let alert = UIAlertController(title: "Add new Person", message: "what is their name, age and lastName", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        let tfName = alert.textFields![0]
        tfName.placeholder = "Name"
        let tfAge = alert.textFields![1]
        tfAge.placeholder = "Age"
        let tfLastName = alert.textFields![2]
        tfLastName.placeholder = "gender"
        
        let submit = UIAlertAction(title: "ADD", style: .default) { action in
            let person = Person(context: self.viewContext)
            person.age = Int16(tfAge.text!) ?? 0
            person.name = tfName.text
            person.gender = tfLastName.text
            
            do
            {
                try self.viewContext.save()
            }catch
            {
                print(error.localizedDescription)
            }
            self.fetchPeople()
            
        }
        alert.addAction(submit)
        self.present(alert, animated: true)
       
    }

    @IBAction func btnAdd(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.addWithAlert()
        }
    }
    
}


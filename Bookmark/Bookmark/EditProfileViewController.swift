//
//  EditProfileViewController.swift
//  Bookmark
//
//  Created by Admin on 5/2/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    var profile: [Profile] = []

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fictionSwitch: UISwitch!
    @IBOutlet weak var nonFictionSwitch: UISwitch!
    
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfile()
        dateFormatter.dateStyle = .short
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateAge(birthdate: Date) -> Int {
        let today = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthdate, to: today)
        
        if let age = ageComponents.year{
            return age
        } else {
            return -1
        }
    }

    @IBAction func saveProfile(_ sender: Any) {
        print("Entered saved profile function.")
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let profile = Profile(context: context)
            profile.name = name.text
            print(profile.name!)
            profile.birthday = datePicker.date as NSDate
            print(profile.birthday!)
            profile.age = Int16(calculateAge(birthdate: datePicker.date))
            print(profile.age)
            if fictionSwitch.isOn {
                profile.is_fiction = true
            } else {
                profile.is_fiction = false
            }
            print(profile.is_fiction)
            if nonFictionSwitch.isOn {
                profile.is_non_fiction = true
            } else {
                profile.is_non_fiction = false
            }
            print(profile.is_non_fiction)
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            print("Save Checkpoint.")
            
            performSegue(withIdentifier: "savedProfile", sender: UIBarButtonItem())
        }
    }

    
    func loadProfile() {
        print("Entered Load Profile method")
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            do {
                profile = try context.fetch(Profile.fetchRequest())
            } catch {
                print("Profile core data fetch request failed.\n")
            }
            
            if let profile = profile.last {
                name.text = profile.name
                if let birthday = profile.birthday as Date? {
                    datePicker.date = birthday
                }
                if profile.is_fiction {
                    fictionSwitch.setOn(true, animated: true)
                } else {
                    fictionSwitch.setOn(false, animated: true)
                }
                if profile.is_non_fiction {
                    nonFictionSwitch.setOn(true, animated: true)
                } else {
                    nonFictionSwitch.setOn(false, animated: true)
                }
            }
        }
    }
    

}

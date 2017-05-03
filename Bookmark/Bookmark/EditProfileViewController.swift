//
//  EditProfileViewController.swift
//  Bookmark
//
//  Created by Admin on 5/2/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fictionSwitch: UISwitch!
    @IBOutlet weak var nonFictionSwitch: UISwitch!
    
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func saveProfile(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let profile = Profile(context: context)
            profile.name = name.text
            profile.birthday = datePicker.date as NSDate
            profile.age = Int16(calculateAge(birthdate: datePicker.date))
            if fictionSwitch.isOn {
                profile.is_fiction = true
            } else {
                profile.is_fiction = false
            }
            if nonFictionSwitch.isOn {
                profile.is_non_fiction = true
            } else {
                profile.is_non_fiction = false
            }
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    }
    

}

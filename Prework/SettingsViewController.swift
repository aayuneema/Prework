//
//  SettingsViewController.swift
//  Prework
//
//  Created by Aayushi Neema on 1/23/21.
//  Copyright © 2021 Aayushi Neema. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipTextField1: UITextField!
    @IBOutlet weak var tipTextField2: UITextField!
    @IBOutlet weak var tipTextField3: UITextField!
    
    @IBOutlet weak var colorBox: UILabel!
    //Access UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        colorBox.layer.masksToBounds = true
        colorBox.layer.cornerRadius = 20
        self.view.backgroundColor = UIColor.systemGray5
        tipTextField1.backgroundColor = UIColor.systemGray5
        tipTextField2.backgroundColor = UIColor.systemGray5
        tipTextField3.backgroundColor = UIColor.systemGray5
        changeMode(_sender: self)
    }
    
    func changeMode(_sender: Any)
    {
        if (defaults.bool(forKey: "darkMode") == true)
        {
            overrideUserInterfaceStyle = .dark
            colorBox.backgroundColor = UIColor.systemIndigo
        }
        else
        {
            overrideUserInterfaceStyle = .light
            colorBox.backgroundColor = UIColor.systemTeal
        }
    }
    @IBAction func changeTip1(_ sender: Any) {
        defaults.set(tipTextField1.text, forKey: "tip1")
        
        // Force UserDefaults to save
        defaults.synchronize()
    }
    @IBAction func changeTip2(_ sender: Any) {
        defaults.set(tipTextField2.text, forKey: "tip2")
        
        // Force UserDefaults to save
        defaults.synchronize()
    }
    @IBAction func changeTip3(_ sender: Any) {
        defaults.set(tipTextField3.text, forKey: "tip3")
        
        // Force UserDefaults to save
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeMode(_sender: self)
        tipTextField1.text = String(format: "%.2f", defaults.double(forKey: "tip1"))
        tipTextField2.text = String(format: "%.2f", defaults.double(forKey: "tip2"))
        tipTextField3.text = String(format: "%.2f", defaults.double(forKey: "tip3"))
    }
}

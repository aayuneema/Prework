//
//  ViewController.swift
//  Prework
//
//  Created by Aayushi Neema on 1/22/21.
//  Copyright © 2021 Aayushi Neema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var colorBox: UILabel!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    var tipPercentage1: Double = 0.15
    var tipPercentage2: Double = 0.18
    var tipPercentage3: Double = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        colorBox.layer.masksToBounds = true
        colorBox.layer.cornerRadius = 20
        self.view.backgroundColor = UIColor.systemGray5
        tipControl.backgroundColor = UIColor.systemGray5
        billAmountTextField.backgroundColor = UIColor.systemGray5
        changeColors(self)
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        defaults.set(tipPercentage1, forKey: "tip1")
        defaults.set(tipPercentage2, forKey: "tip2")
        defaults.set(tipPercentage3, forKey: "tip3")
        
        // Force UserDefaults to save
        defaults.synchronize()
    }

    @IBAction func changeColors(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        if (darkModeSwitch.isOn == true)
        {
            defaults.set(true, forKey: "darkMode")
            overrideUserInterfaceStyle = .dark
            colorBox.backgroundColor = UIColor.systemIndigo
        }
        else
        {
            defaults.set(false, forKey: "darkMode")
            overrideUserInterfaceStyle = .light
            colorBox.backgroundColor = UIColor.systemTeal
        }
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [tipPercentage1, tipPercentage2, tipPercentage3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        tipPercentage1 = defaults.double(forKey: "tip1")
        tipPercentage2 = defaults.double(forKey: "tip2")
        tipPercentage3 = defaults.double(forKey: "tip3")

        tipControl.setTitle(String(format: "%.2f%%", tipPercentage1 * 100), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.2f%%", tipPercentage2 * 100), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.2f%%", tipPercentage3 * 100), forSegmentAt: 2)
        
        // Force UserDefaults to save
        defaults.synchronize()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
}


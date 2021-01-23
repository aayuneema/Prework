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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        colorBox.layer.masksToBounds = true
        colorBox.layer.cornerRadius = 20
        self.view.backgroundColor = UIColor.systemGray5
        changeColors(self)
    }

    @IBAction func changeColors(_ sender: Any) {
        if (darkModeSwitch.isOn == true)
        {
            overrideUserInterfaceStyle = .dark
            colorBox.backgroundColor = UIColor.systemIndigo
            billAmountTextField.backgroundColor = UIColor.systemGray5
            tipControl.backgroundColor = UIColor.systemGray5
        }
        else
        {
            overrideUserInterfaceStyle = .light
            colorBox.backgroundColor = UIColor.systemTeal
            billAmountTextField.backgroundColor = UIColor.white
            tipControl.backgroundColor = UIColor.systemGray5
        }
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
}


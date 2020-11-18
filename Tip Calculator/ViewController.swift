//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Siva Veerapalli on 11/17/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        let bill = Double(billText.text!) ?? 0
        let tipPercentage = [0.15,0.18,0.20]
        
        //calculate tip and total
        if( bill > 0.0){
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        }else{
            
        }
    }
    
    @IBAction func calculateTipBasedOnTipSlider(_ sender: UISlider) {
        //get bill amount
        let bill = Double(billText.text!) ?? 0
        let tipPercentage = Double(Int(String(format: "%.0f", sender.value)) ?? 0)
                
        if( bill > 0.0 && tipPercentage > 0.0){
            let tip = bill * Double( tipPercentage / 100 )
            let total = bill + tip
            
            tipLabel.text = String(format: "$%.2f",  tip)
            totalLabel.text = String(format: "$%.2f", total)
        }else{
            tipLabel.text = String(format: "$%.2f", 0)
            totalLabel.text = String(format: "$%.2f", bill)
        }
        
    }
}


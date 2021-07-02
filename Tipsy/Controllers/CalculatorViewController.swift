//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var numPeople = 2
    var tipPct: Float = 0.0
    var billPerPerson: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        numPeople = Int(sender.value)
        splitNumberLabel.text = String(numPeople)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {

        if zeroPctButton.isSelected {
            tipPct = 0
        }
        else if tenPctButton.isSelected {
            tipPct = 0.1
        }
        else if twentyPctButton.isSelected {
            tipPct = 0.2
        }

        print("Tip % = \(tipPct), Num people=\(numPeople)")
        if let billText = billTextField.text {
            if let billAmount = Float(billText) {
                print("Bill amount = \(billAmount)")

                billPerPerson = (billAmount + (billAmount * tipPct)) / Float(numPeople)
                let billPerPersonStr = String(format: "%.2f", billPerPerson)
                print("Bill per person: \(billPerPersonStr)")

                self.performSegue(withIdentifier: "ShowResults", sender: self)

            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowResults" {
            print("Sending to vc \(numPeople)")
            let vc = segue.destination as! ResultsViewController
            vc.numPeople = numPeople
            vc.tipPercent = Int(tipPct * 100)
            vc.totalPerPerson = billPerPerson
        }
    }
}


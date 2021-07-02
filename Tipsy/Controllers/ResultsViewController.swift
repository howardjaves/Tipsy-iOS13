//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Howard Javes on 28/06/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    var totalPerPerson: Float?
    var numPeople: Int?
    var tipPercent: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Total per person: \(totalPerPerson)")
        print("Num people: \(numPeople)")
        
        if let totalPerPerson = totalPerPerson {
            totalLabel.text = String(format: "%.2f", totalPerPerson)
        }

        if let numPeople = numPeople {
            if let tipPercent = tipPercent {
                settingsLabel.text = "Split between \(numPeople) people, with \(tipPercent)% tip"
            }
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

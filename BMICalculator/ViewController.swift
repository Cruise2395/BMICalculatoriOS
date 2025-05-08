//
//  ViewController.swift
//  BMICalculator
//
//  Created by Mañanas on 5/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
   
    var height = 170
    var weight = 60
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onWeightChanged(_ sender: UIStepper) {
        weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
    }
    @IBAction func onHeightChanged(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    @IBAction func calculate(_ sender: Any) {
        let result = Float(weight) / pow ((Float(height) / 100.0), 2)
        resultLabel.text = String(format: "%.2f", result)
    }
}


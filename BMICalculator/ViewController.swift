import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
        
        var color = UIColor.black
        var description = ""
        var showAlert = false
        
        switch(result){
        case 0.0..<18.5:
            color = UIColor(named: "bmi_underweight")!
            description = "Underweight"
        case 18.5...24.9:
            color = UIColor(named: "bmi_normal")!
            description = "Normal"
        case 25.0...29.9:
            color = UIColor(named: "bmi_overweight")!
            description = "Overweight"
        case 30.0...34.9:
            color = UIColor(named: "bmi_overweightII")!
            description = "Overweight II"
        case 35.0...40:
            color = UIColor(named: "bmi_overweightIII   ")!
            description = "Overweight III"
        default:
            color = UIColor(named: "obese")!
            description = "Obese"
            showAlert = true
        }
        
        descriptionLabel.text = description
        
        resultLabel.textColor = color
        descriptionLabel.textColor = color
        
        if (showAlert) {
            let alert = UIAlertController(
                title: "Riesgo de salud",
                message: " Tu peso actual pone en grave riesgo tu vida.Busca ayuda medica cuanto antes.",
                preferredStyle: .alert
            )
            alert.addAction (UIAlertAction(title: "Mas información", style: .default, handler: { action in
                //He pulsado mas informacion
                let advicesiteUrl = "https://medlineplus.gov/spanish/ency/patientinstructions/000348.htm"
                if let url = URL(string: advicesiteUrl), UIApplication.shared.canOpenURL(url){
                    UIApplication.shared.open(url)
                }
            }))
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

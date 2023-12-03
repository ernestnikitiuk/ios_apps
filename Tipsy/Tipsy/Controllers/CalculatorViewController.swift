
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 2
    var billNumber: Float = 0.00
    var countedResult: Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        billTextField.endEditing(true)
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        manageButtonsSelections(button: sender)
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercent = String(buttonTitle.dropLast())
        let buttonNum = Double(buttonTitleMinusPercent)!/100
        tip = buttonNum
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billNumber = getBill(textFieldText: billTextField)
        
        
        
        countedResult = (billNumber + (billNumber * Float(tip))) / Float(numberOfPeople)
        let resultToShow = String(format: "%.2f", countedResult)
        print(resultToShow)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.moneyToShow = String(format: "%.2f", countedResult)
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipsAmount = Int(tip*100)
        }
    }
    
    
    func manageButtonsSelections(button: UIButton){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        button.isSelected = true
    }
    
    
    func getBill(textFieldText: UITextField) -> Float {
        let prebill = textFieldText.text ?? "0.0"
        let bill = Float(prebill.replacingOccurrences(of: ",", with: ".")) ?? 0.0
        return bill
    }
    
}


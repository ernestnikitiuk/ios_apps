import UIKit

struct CalculatorBrain{
    
    var bmi: BMI?
     
    let colors = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.606883347, green: 0.1101260856, blue: 0.1197500303, alpha: 1)]
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
            
        if bmiValue < 18.5 {
            bmi =  BMI(value: bmiValue, advice: "Underweight", color: colors[0] )
        }else if  bmiValue <= 24.9 {
            bmi =  BMI(value: bmiValue, advice: "Normal", color: colors[1])
        }else {
            bmi =  BMI(value: bmiValue, advice: "Overweight", color: colors[2])
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Error"
    }
    
    func getColor() -> UIColor {
        return bmi!.color
    }
    
    
    
}


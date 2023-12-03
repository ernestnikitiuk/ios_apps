//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()
    var currencyName: String?
   
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        
    }
    

}

//MARK: - Data Source

extension ViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
}

//MARK: - View Delegate
extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chosenRow = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: chosenRow)
        currencyName = coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
}



//MARK: - Coin Manager Delegate
extension ViewController: CoinManagerDelegate{
    
    func didUpdateCurrency(currencyRate: String, currencyName: String){
        DispatchQueue.main.async {
            self.bitcoinLabel.text = currencyRate
            self.currencyLabel.text = currencyName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


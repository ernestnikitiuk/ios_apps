

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateCurrency(currencyRate: String, currencyName: String)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    //apikey=D2FFD240-52ED-4B01-99AC-54DED220F7E9
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    func getCoinPrice(for currency: String){
        let url = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=D2FFD240-52ED-4B01-99AC-54DED220F7E9"
        performRequest(with: url, currencyName: currency)
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","UAH","ZAR"]

    func performRequest(with urlString: String, currencyName: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
//                    if let stringData = String(data: safeData, encoding: String.Encoding.utf8){
//                        print(stringData)
//                    }
                    if let exRateInfo = self.parseJSON(safeData){
                        delegate?.didUpdateCurrency(currencyRate: exRateInfo, currencyName: currencyName)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> String?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = String(format: "%.2f",  decodedData.rate)
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}

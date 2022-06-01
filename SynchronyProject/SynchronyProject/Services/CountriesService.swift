//
//  CountriesService.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import Foundation
import UIKit

struct CountriesService {
    let url = URL(string: "https://restcountries.eu/rest/v2/all")!
    
    func getCountries() -> [CountriesModel] {
        var decodedData = [CountriesModel]()
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                decodedData = try decoder.decode(Array<CountriesModel>.self, from: data)
            } catch {
                fatalError()
            }
            semaphore.signal()
        }).resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return decodedData
    }
    
}

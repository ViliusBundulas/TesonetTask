//
//  ApiManager.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-13.
//

import Foundation

protocol ContinentsAPIProtocol {
    func getContinents(_ completion: @escaping (Result<[Continent], APIError>) -> ())
}

struct ApiManager: ContinentsAPIProtocol {
    
    func getContinents(_ completion: @escaping (Result<[Continent], APIError>) -> ()) {
        guard let url = URL(string: "https://pkgstore.datahub.io/JohnSnowLabs/country-and-continent-codes-list/country-and-continent-codes-list-csv_json/data/c218eebbf2f8545f3db9051ac893d69c/country-and-continent-codes-list-csv_json.json") else {
            completion(Result.failure(APIError.badURL))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let continents = try JSONDecoder().decode([Continent].self, from: data)
                        completion(.success(continents))
                    } catch {
                        completion(.failure(.unknown))
                    }
                } else {
                    completion(.failure(.unknown))
                }
            }
        }
        
        task.resume()
    }
}

//
//  ContinentsViewModel.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import Foundation

class ContinentsViewModel: ObservableObject {
    
    @Published private(set) var continents = [Continent]()
    @Published private(set) var europe = [Continent]()
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil
    
    private let apiManager: ContinentsAPIProtocol
    
    init(apiManager: ContinentsAPIProtocol = ApiManager()) {
        self.apiManager = apiManager
        fetchContinents()
    }
    
    func fetchContinents() {
        
        self.isLoading = true
        
        apiManager.getContinents { [unowned self] result in
            self.isLoading = false
            switch result {
            case .success(let continents):
                self.continents = continents
                    .sorted { $0.shorterCountryName < $1.shorterCountryName }
                self.europe = continents
                    .filter { $0.continentCode == .eu }
                    .sorted { $0.shorterCountryName < $1.shorterCountryName }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error.description)
            }
        }
    }
}

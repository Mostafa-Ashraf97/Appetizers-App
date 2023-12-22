//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by A on 11/12/2023.
//

import Foundation

class AppetizersListViewModel:ObservableObject {
    
    @Published var appetizers : [Appetizer] = []
    @Published var isLoading = false
    @Published var isShowingDetil = false
    @Published var selectedAppetizer: Appetizer?
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}

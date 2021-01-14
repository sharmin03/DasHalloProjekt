//
//  PrivacyDataViewModel.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 20.12.20.
//

import Foundation
import SwiftUI

class PrivacyDataViewModel: ObservableObject {
    
    @Published var privacyData: [String] = []
    private let networkManager: NetworkManager
    
    //injecting the fetch service in the view model
    init(_ networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchPrivacyData() {
        self.networkManager.fetchPrivacyData { (privacyData, error) in
            guard let _ = error else { return }
            if let pData = privacyData {
                for each in pData {
                    self.privacyData.append(each)
                }
            }
        }
    }
}

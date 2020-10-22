//
//  ViewRouter.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 21.10.20.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    var accountState: AccountState = .login {
        didSet {
            objectWillChange.send(self)
        }
    }
}

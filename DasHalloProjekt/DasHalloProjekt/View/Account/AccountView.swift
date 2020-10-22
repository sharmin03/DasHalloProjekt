//
//  AccountView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 21.10.20.
//

import SwiftUI

enum AccountState {
    case login, signup
}

struct AccountView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.accountState == .login {
                AccountLoginIn()
            } else if viewRouter.accountState == .signup {
                AccountSignUpView()
            }
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewRouter: ViewRouter())
    }
}

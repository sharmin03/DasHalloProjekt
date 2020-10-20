//
//  ForgetPasswordView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @State private var email: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(StaticStrings.forgotPasswordDescription).foregroundColor(Colors.DHPMainColor).multilineTextAlignment(.center).padding(.horizontal, 18).padding(.top, 8)
                TextField("E-mail", text: $email)
                    .padding(.horizontal, 20).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 20)
                Button(action: {}) {
                    Text(StaticStrings.confirm).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
                }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
                Spacer()
            }
        }.navigationBarTitle(Text("Passwort Vergessen"), displayMode: .inline)
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}

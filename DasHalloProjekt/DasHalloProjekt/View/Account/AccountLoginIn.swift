//
//  AccountLoginIn.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI
import Firebase

struct AccountLoginIn: View {
    
    //@ObservedObject var viewRouter: ViewRouter
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword = false
    @State private var shouldAnimate = false
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Colors.DHPMainColor)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text(StaticStrings.signInDescription).foregroundColor(Colors.DHPMainColor).multilineTextAlignment(.center).padding(.horizontal, 18).padding(.top, 8)
                Group {
                    TextField("E-mail", text: $email)
                        .padding(.horizontal, 20).padding(.top, 20)
                    Divider()
                        .padding(.horizontal, 20)
                    HStack() {
                        if showPassword {
                            TextField("Passwort",
                                      text: $password)
                        } else {
                            SecureField("Passwort",
                                        text: $password)
                        }
                        Button(action: {
                            self.showPassword.toggle()}) {
                            if showPassword {
                                Image(systemName: "eye.slash")
                                    .foregroundColor(.secondary)
                            } else {
                                Image(systemName: "eye")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }.padding(.horizontal,20).padding(.top, 20)
                    Divider()
                        .padding(.horizontal, 20).padding(.top,2)
                }
                Button(action: {
                    self.shouldAnimate = true
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                       
                        self.shouldAnimate = false
                    }
                }) {
                    Text(StaticStrings.login).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
                }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
                Button(action: {
                    
                }, label: {
                    Text("Passwort Vergessen?").foregroundColor(.purple).underline()
                }).padding(.top,10).padding(.horizontal,20)
                ActivityIndicator(shouldAnimate: self.$shouldAnimate).padding(.top, 8).padding(.horizontal, 20)
                Spacer()
            }
        }.navigationBarTitle(Text(StaticStrings.appName))
    }
}

struct AccountLoginIn_Previews: PreviewProvider {
    static var previews: some View {
        AccountLoginIn()
    }
}

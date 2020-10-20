//
//  AccountSignUpView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI

struct AccountSignUpView: View {
    
    @State private var email: String = ""
    @State private var vorname: String = ""
    @State private var nachname: String = ""
    @State private var password: String = ""
    @State private var passwordRepeat: String = ""
    @State private var showPassword = false
    @State private var agreedToTerms = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().backgroundColor = UIColor(Colors.DHPMainColor)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(StaticStrings.signUpDescription).foregroundColor(Colors.DHPMainColor).multilineTextAlignment(.center).padding(.horizontal, 18).padding(.top, 8)
                Group{
                    TextField("E-mail", text: $email)
                        .padding(.horizontal, 20).padding(.top, 20)
                    Divider()
                        .padding(.horizontal, 20)
                    TextField("Vorname", text: $vorname)
                        .padding(.horizontal, 20).padding(.top, 20)
                    Divider()
                        .padding(.horizontal, 20)
                    TextField("Nachname", text: $nachname)
                        .padding(.horizontal, 20).padding(.top, 20)
                    Divider()
                        .padding(.horizontal, 20)
                }
                Group {
                    HStack() {
                        if showPassword {
                            TextField("Passwort",
                                      text: $password)
                        } else {
                            SecureField("Passwort",
                                        text: $password)
                        }
                        Button(action: { self.showPassword.toggle()}) {
                            Image(systemName: "eye")
                                .foregroundColor(.secondary)
                        }
                    }.padding(.horizontal,20).padding(.top, 20)
                    Divider()
                        .padding(.horizontal, 20).padding(.top,2)
                    Text(StaticStrings.passwordDescription).foregroundColor(Colors.formLightGrey).padding(.horizontal, 20).padding(.top, 4)
                    HStack() {
                        if showPassword {
                            TextField("Passwort Wiederholen",
                                      text: $password)
                        } else {
                            SecureField("Passwort Wiederholen",
                                        text: $password)
                        }
                        Button(action: { self.showPassword.toggle()}) {
                            Image(systemName: "eye")
                                .foregroundColor(.secondary)
                        }
                    }.padding(.horizontal,20).padding(.top, 20)
                    Divider().padding(.horizontal, 20).padding(.top,2)
                }
                Toggle(isOn: $agreedToTerms) {
                    Text(StaticStrings.acceptDataPrivacyDescription1)
                        .foregroundColor(Colors.formLightGrey)
                    
                    Text(StaticStrings.acceptDataPrivacyDescription2)
                        .foregroundColor(Colors.DHPMainColor)
                        .underline()
                        .onTapGesture {
                            let url = URL.init(string: "https://stackoverflow.com/")
                            guard let stackOverflowURL = url, UIApplication.shared.canOpenURL(stackOverflowURL) else { return }
                            UIApplication.shared.open(stackOverflowURL)
                        }
                    
                    Text(StaticStrings.acceptDataPrivacyDescription3)
                        .foregroundColor(Colors.formLightGrey)
                }.padding(.horizontal, 20).padding(.top, 30)
                
                Button(action: {}) {
                    Text(StaticStrings.save).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
                }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
                Spacer()
            }
        }.navigationBarTitle(Text("Account erstellen"), displayMode: .inline).navigationBarHidden(false)
        
    }
}


struct AccountSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSignUpView()
    }
}



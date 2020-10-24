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
    @State var showMenu = false
    @State private var presentingToast: Bool = false
    @State var toastText: String = ""
    
    var body: some View {
        
        let tap = TapGesture()
            .onEnded {

                withAnimation {
                    self.showMenu = false
                }
            }
        NavigationView{
            ZStack {
                
                VStack(alignment: .center) {
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
                            
                            if let _ = error {
                                if email.isEmpty || password.isEmpty {
                                    withAnimation(.easeIn) {
                                        presentingToast = true
                                    }
                                    toastText = StaticStrings.giveEmailAndPassword
                                } else {
                                    withAnimation(.easeIn) {
                                        presentingToast = true
                                    }
                                    toastText = StaticStrings.incorrectEmailAndPassword
                                }
                            }
                            self.shouldAnimate = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeOut) {
                                    presentingToast = false
                                }
                            }
                        }
                    }) {
                        Text(StaticStrings.login).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
                    }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
                    
                    Button(action: {
                    }, label: {
                        Text("Passwort Vergessen?").foregroundColor(.purple).underline()
                    }).padding(.top,10).padding(.horizontal,20)
                    ActivityIndicator(shouldAnimate: self.$shouldAnimate).padding(.top, 8).padding(.horizontal, 20)
                    Toast(showToast: $presentingToast, text: $toastText).padding(.horizontal, 40)
                    Spacer()
                }
                
                GeometryReader(content: { geometry in
                    
                    HStack {
                        HamburgerMenu().offset(x: self.showMenu ? 0 : -geometry.size.width)
                            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
                        Spacer()
                    }
                }).background(Color.black.opacity(self.showMenu ? 0.5: 0))
                
                
            }.navigationBarItems(leading: (
                HamburgerIcon(showMenu: $showMenu)
            ))
            .navigationBarTitle(Text(StaticStrings.appName), displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor(Colors.DHPMainColor)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
            .gesture(tap)
            
        }
    }
}

struct AccountLoginIn_Previews: PreviewProvider {
    static var previews: some View {
        AccountLoginIn()
    }
}


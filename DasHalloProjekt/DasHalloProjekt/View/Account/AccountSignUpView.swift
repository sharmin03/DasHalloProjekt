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
    @State private var showPasswordRepeat = false
    @State private var agreedToTerms = false
    
    var body: some View {
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
                Text(StaticStrings.passwordDescription).foregroundColor(Colors.formLightGrey).padding(.horizontal, 20).padding(.top, 4)
                HStack() {
                    if showPasswordRepeat {
                        TextField("Passwort Wiederholen",
                                  text: $passwordRepeat)
                    } else {
                        SecureField("Passwort Wiederholen",
                                    text: $passwordRepeat)
                    }
                    Button(action: { self.showPasswordRepeat.toggle()}) {
                        if showPasswordRepeat {
                            Image(systemName: "eye.slash")
                                .foregroundColor(.secondary)
                        } else {
                            Image(systemName: "eye")
                                .foregroundColor(.secondary)
                        }
                        
                    }
                }.padding(.horizontal,20).padding(.top, 20)
                Divider().padding(.horizontal, 20).padding(.top,2)
            }
            Toggle(isOn: $agreedToTerms) {
                TextLabelWithHyperlink()
                    .frame(width: 300, height: 100)
            }.padding(.horizontal, 20).padding(.top, 30)
            
            Button(action: {}) {
                Text(StaticStrings.save).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
            }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
            Spacer()
        }
    }
}


struct AccountSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSignUpView()
    }
}


struct TextLabelWithHyperlink: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UITextView {
        
        let standartTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor(Colors.formLightGrey)
        ]
        
        let attributedText = NSMutableAttributedString(string: StaticStrings.acceptDataPrivacyDescription1)
        attributedText.addAttributes(standartTextAttributes, range: attributedText.range) // check extention
        
        let hyperlinkTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor(Colors.DHPMainColor),
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.link: "https://stackoverflow.com"
        ]
        
        let textWithHyperlink = NSMutableAttributedString(string: StaticStrings.acceptDataPrivacyDescription2)
        textWithHyperlink.addAttributes(hyperlinkTextAttributes, range: textWithHyperlink.range)
        attributedText.append(textWithHyperlink)
        
        let endOfAttrString = NSMutableAttributedString(string: StaticStrings.acceptDataPrivacyDescription3)
        endOfAttrString.addAttributes(standartTextAttributes, range: endOfAttrString.range)
        attributedText.append(endOfAttrString)
        
        let textView = UITextView()
        textView.attributedText = attributedText
        
        textView.isEditable = false
        textView.textAlignment = .natural
        textView.isSelectable = true
        
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {}
    
}
extension NSMutableAttributedString {
    
    var range: NSRange {
        NSRange(location: 0, length: self.length)
    }
    
}

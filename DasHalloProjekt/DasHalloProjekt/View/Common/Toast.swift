//
//  Toast.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 24.10.20.
//

import SwiftUI

struct Toast: View {
    
    @Binding var showToast: Bool
    @Binding var text: String

    var body: some View {
        if showToast {
            Text(text).frame(height: 50, alignment: .center).foregroundColor(.white).background(Color.black.opacity(0.4)).cornerRadius(5.0)
        }
    }
}

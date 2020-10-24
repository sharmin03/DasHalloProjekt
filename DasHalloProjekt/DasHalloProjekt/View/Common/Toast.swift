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
            GeometryReader(content: { geometry in
                Text(text).frame(width: geometry.size.width*0.8, height: 50, alignment: .center).foregroundColor(.white).background(Color.black.opacity(0.5)).cornerRadius(geometry.size.height/2)
            })
        }
    }
}

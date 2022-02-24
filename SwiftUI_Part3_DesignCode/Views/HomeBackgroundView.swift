//
//  BackgroundView.swift
//  SwiftUI_Part3_DesignCode
//
//  Created by Simon Mcneil on 2022-02-23.
//

import SwiftUI

struct HomeBackgroundView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color("background2"), Color("background1")]),
                           startPoint: .top, endPoint: .bottom)
                .frame(height: 200)
            Spacer()
        }
        .background(Color("background1"))
        .clipShape(RoundedRectangle(cornerRadius: showProfile ? 30: 0, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView(showProfile: .constant(false))
    }
}

//
//  WatchRingsView.swift
//  SwiftUI_Part2_DesignCode
//
//  Created by Simon Mcneil on 2022-01-14.
//

import SwiftUI

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 20) {
            
            HStack(spacing: 12.0) {
                RingView(color1: Color(hue: 0.797, saturation: 1.0, brightness: 0.953),
                         color2: Color(hue: 0.55, saturation: 0.887, brightness: 1.0), width: 44, height: 44, percent: 68, showProgressRing: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left").bold().modifier(FontModifierStyle(style: .subheadline))
                    Text("Watched 10 minutes today").modifier(FontModifierStyle(style: .caption))
                }
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShawdowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: Color(hue: 0.308, saturation: 0.996, brightness: 0.869),
                         color2: Color(hue: 0.692, saturation: 1.0, brightness: 0.921),
                         width: 32,
                         height: 32, percent: 54, showProgressRing: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShawdowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: Color(hue: 1.0, saturation: 0.552, brightness: 1.0),
                         color2: Color(hue: 0.54, saturation: 1.0, brightness: 1.0),
                         width: 32,
                         height: 32, percent: 64, showProgressRing: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShawdowModifier())
        }
    }
}

struct WatchRingsView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRingsView()
    }
}

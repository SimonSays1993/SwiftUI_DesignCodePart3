//
//  RingView.swift
//  SwiftUI_Part2_DesignCode
//
//  Created by Simon Mcneil on 2022-01-12.
//

import SwiftUI

struct RingView: View {
    var color1 = Color.red
    var color2 = Color.purple
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 56
    
    @Binding var showProgressRing: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
            //Inactive String, the grey circle
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: showProgressRing ? progress : 0.999, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .animation(.easeInOut(duration: 0.5).delay(0.2), value: showProgressRing)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: color2.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)

    
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(showProgressRing: .constant(true))
    }
}

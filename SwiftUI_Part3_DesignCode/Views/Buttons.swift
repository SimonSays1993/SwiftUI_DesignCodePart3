//
//  Buttons.swift
//  SwiftUI_Part3_DesignCode
//
//  Created by Simon Mcneil on 2022-01-31.
//

import SwiftUI

struct Buttons: View {
    @State var tap = false
    @State var press = false
    
    var body: some View {
        VStack {
            Text("Button")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 60)
                .background(
                    ZStack {
                        Color(press ? .white : #colorLiteral(red: 0.7608050108,
                                                             green: 0.8164883852,
                                                             blue: 0.9259157777,
                                                             alpha: 1))
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(Color(press ? #colorLiteral(red: 0.7608050108,
                                                                         green: 0.8164883852,
                                                                         blue: 0.9259157777,
                                                                         alpha: 1) : .white))
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                            .padding(2.0)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 24, weight: .light))
                            .foregroundColor(
                                Color.white.opacity(press ? 0 : 1)
                            )
                            .frame(width: press ? 64 : 54, height: press ? 4: 50)
                            .background(Color(hue: 0.692, saturation: 0.985, brightness: 1.0))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: Color(hue: 0.692, saturation: 0.985, brightness: 1.0).opacity(0.3),
                                radius: 10, x: 10, y: 10)
                            .offset(x: press ? 70 : -10, y: press ? 16 : 0)
                            .animation(.linear(duration: 0.15))
                        Spacer()
                    }
                )
                .shadow(color: Color(press ? .white : #colorLiteral(red: 0.7608050108,
                                                                    green: 0.8164883852,
                                                                    blue: 0.9259157777,
                                                                    alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108,
                                                           green: 0.8164883852,
                                                           blue: 0.9259157777,
                                                           alpha: 1) : .white ), radius: 20, x: -20, y: 20)
                .scaleEffect(tap ? 1.2 : 1)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5).onChanged { value in
                        self.tap = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.tap = false
                        }
                    }.onEnded{ value in
                        self.press.toggle()
                    }
                )
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}



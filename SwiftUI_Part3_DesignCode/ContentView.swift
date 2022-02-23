//
//  ContentView.swift
//  SwiftUI_Part1_DesignCode
//
//  Created by Simon Mcneil on 2021-12-30.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showBottomCard = false
    @State var bottomCardState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        //We use ZStack to act as a layer underneath the card. Acts as background
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showBottomCard ? 0.4 : 1)
                .offset(y: showBottomCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                )
            
            //This is are background
            BackCardView()
                .frame(maxWidth: showBottomCard ? 300 : 340)
                .frame(height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width , y: viewState.height)
                .offset(y: showBottomCard ? -180 : 0)
                .scaleEffect(showBottomCard ? 1 : 0.90)
                .rotationEffect(.degrees(show ? 0 : 10.0))
                .rotationEffect(Angle(degrees: showBottomCard ? -10 : 0))
                .rotation3DEffect(.degrees(showBottomCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .frame(maxWidth: 340)
                .frame(height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width , y: viewState.height)
                .offset(y: showBottomCard ? -140 : 0)
                .scaleEffect(showBottomCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(Angle(degrees: showBottomCard ? -5 : 0))
                .rotation3DEffect(.degrees(showBottomCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            //This is are foreground
            CertificateView()
                .frame(maxWidth: showBottomCard ? 375 : 340)
                .frame(height: 220)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showBottomCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20.0)
                .offset(x: viewState.width , y: viewState.height)
                .offset(y: showBottomCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3,
                                   dampingFraction: 0.6,
                                   blendDuration: 0))
                .onTapGesture {
                    //Automatically switches the bool value everytime we tap on the view
                    self.showBottomCard.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }.onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )
            
            GeometryReader { geometryBounds in
                BottomCardView(show: $showBottomCard)
                    .offset(x: 0, y: showBottomCard ? geometryBounds.size.height / 2 :
                                geometryBounds.size.height +
                                geometryBounds.safeAreaInsets.top +
                                geometryBounds.safeAreaInsets.bottom)
                    .offset(y: bottomCardState.height)
                    .blur(radius: show ? 20 : 0)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    .gesture(
                        DragGesture().onChanged { value in
                            self.bottomCardState = value.translation
                            if self.showFull {
                                self.bottomCardState.height += -300
                            }
                            if self.bottomCardState.height < -300 {
                                self.bottomCardState.height = -300
                            }
                        }
                            .onEnded { value in
                                if self.bottomCardState.height > 50 {
                                    self.showBottomCard = false
                                }
                                if (self.bottomCardState.height < -100 && !self.showFull) || (self.bottomCardState.height < -250 && self.showFull) {
                                    self.bottomCardState.height = -300
                                    self.showFull = true
                                } else {
                                    self.bottomCardState = .zero
                                    self.showFull = false
                                }
                            }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //lets us see a fixed layout for other dimenses instead of having to build  sim all the time. 
            .previewLayout(.fixed(width: 320, height: 667))
    }
}

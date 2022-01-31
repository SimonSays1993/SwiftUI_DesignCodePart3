//
//  BackgroundView.swift
//  SwiftUI_Part1_DesignCode
//
//  Created by Simon Mcneil on 2021-12-30.
//

import SwiftUI

struct BackCardView: View {
    var body: some View {
        //The VStack acts as a layer so we can put are modifers on the background card.
        VStack {
            Spacer()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView()
    }
}

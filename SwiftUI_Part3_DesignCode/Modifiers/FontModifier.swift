//
//  FontModifier.swift
//  SwiftUI_Part2_DesignCode
//
//  Created by Simon Mcneil on 2022-01-14.
//

import SwiftUI

struct FontModifierStyle: ViewModifier {
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .default))
            .font(.system(size: 20))
    }
}

struct CustomFontModifier: ViewModifier {
    var size: CGFloat = 28
    
    func body(content: Content) -> some View {
        content
            .font(.custom("WorkSans-Bold", size: size))
    }
}

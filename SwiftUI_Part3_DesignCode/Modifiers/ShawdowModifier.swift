//
//  Modifiers.swift
//  SwiftUI_Part2_DesignCode
//
//  Created by Simon Mcneil on 2022-01-14.
//

import SwiftUI

struct ShawdowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 12)
    }
}

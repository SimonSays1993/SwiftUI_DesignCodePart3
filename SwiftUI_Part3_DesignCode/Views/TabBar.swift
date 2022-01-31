//
//  TabBar.swift
//  SwiftUI_Part1_DesignCode
//
//  Created by Simon Mcneil on 2022-01-11.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            CourseList().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Coures")
            }
        }
        .accentColor(Color.black)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().environment(\.colorScheme, .dark)
    }
}

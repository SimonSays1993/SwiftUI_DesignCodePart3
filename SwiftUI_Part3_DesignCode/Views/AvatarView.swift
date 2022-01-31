//
//  AvatarView.swift
//  SwiftUI_Part1_DesignCode
//
//  Created by Simon Mcneil on 2022-01-07.
//

import SwiftUI

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button {
            self.showProfile.toggle()
        } label: {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(showProfile: .constant(false))
    }
}

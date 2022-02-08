import SwiftUI

struct Buttons: View {
    
    var body: some View {
        VStack(spacing: 50) {
            RectangleButton()
            CircleButton()
            PayButton()
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

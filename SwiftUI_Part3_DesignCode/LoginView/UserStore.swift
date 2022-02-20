import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged = false
    @Published var showLogin = false
}

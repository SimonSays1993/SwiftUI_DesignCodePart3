import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            //Here we make sure that when the application loads, we are going to pull any data, that has already been stored using user defaults in the isLogged value
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
}

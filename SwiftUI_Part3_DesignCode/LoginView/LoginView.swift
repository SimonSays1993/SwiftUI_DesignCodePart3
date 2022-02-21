import SwiftUI
import Firebase

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    
    @State var showAlert = false
    @State var alertMessage = "Something went wrong"
    
    //Loading Lottie Animation
    @State var isLoading = false
    
    //Login state
    @State var isSuccessful = false
    
    @EnvironmentObject var user: UserStore
    
    func login() {
        self.hideKeyboard()
        self.isFocused = false
        self.isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            self.isLoading = false
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
            } else {
                self.isSuccessful = true
                self.user.isLogged = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isSuccessful = false
                    self.email = ""
                    self.password = ""
                    self.user.showLogin = false
                }
            }
        }
    }
    
    //Sends global notification to hide the keyboard
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .top) {
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                    .offset(y: isFocused ?  225 : 0)
                
                CoverView()
                 
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(red: 0.685, green: 0.778, blue: 0.86))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading, 16)
                        TextField("Your Email".uppercased(), text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                    }
                    
                    Divider().padding(.leading, 80)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(red: 0.685, green: 0.778, blue: 0.86))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading, 16)
                        SecureField("Your password".uppercased(), text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                    }
                }
                .frame(height: 136)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: 458)
                
                HStack {
                    Text("Forgot password?")
                        .font(.subheadline)
                    
                    Spacer()

                    Button(action: {
                        self.login()
                    }) {
                        Text("Log in").foregroundColor(.black)
                    }
                    .padding(12)
                    .padding(.horizontal, 30)
                    .background(Color(red: 0.0, green: 0.7529411764705882, blue: 1.0))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(red: 0.0, green: 0.7529411764705882, blue: 1.0).opacity(0.3),
                            radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK ")))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
                .offset(y: isFocused ?  225 : 0)
            }
            .offset(y: isFocused ?  -300 : 0)
            .animation(isFocused ? .easeInOut : nil)
            .onTapGesture {
                self.isFocused = false
                self.hideKeyboard()
            }

            if isLoading {
                LoadingView()
            }
            
            if isSuccessful {
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    @State var show = false
    @State var viewState: CGSize = .zero
    @State var isDragging = false
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    Text("Learn design & code.\nFrom scratch.")
                        .font(.system(size: geometry.size.width / 11, weight: .bold ))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(maxWidth: 375, maxHeight: 100)
            .padding(.horizontal, 16)
            .offset(x: viewState.width / 15, y: viewState.height / 15)
            
            Text("80 hours of courses for SWiftUI, React and design tools")
                .font(.subheadline)
                .frame(width: 250)
                .offset(x: viewState.width / 20, y: viewState.height / 20)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top, 100)
        .frame(height: 477)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                Image(uiImage: UIImage(named: "Blob")!)
                    .offset(x: -150, y: -150)
                    .rotationEffect(Angle(degrees: show ? 360 + 90 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                    //.animation(nil)
                    .onAppear {
                        self.show = true
                    }
                
                Image(uiImage: UIImage(named: "Blob")!)
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                    .blendMode(.overlay)
                    //.animation(nil)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
            }
        )
        .background(
            Image(uiImage: UIImage(named: "Card3")!).offset(x: viewState.width / 25, y: viewState.height / 25)
            , alignment: .bottom)
        .background(Color(red: 0.4117647058823529, green: 0.47058823529411764, blue: 0.9725490196078431))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .scaleEffect(isDragging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .rotation3DEffect(Angle(degrees: 5), axis: (x: viewState.width, y: viewState.height, z: 0))
        .gesture(
            DragGesture().onChanged({ value in
                self.viewState = value.translation
                self.isDragging = true
            }).onEnded({ value in
                self.viewState = .zero
                self.isDragging = false
            })
        )
    }
}

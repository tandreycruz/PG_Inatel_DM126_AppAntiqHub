//
//  LoginView.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUser = 0
    @State private var wrongPass = 0
    @State private var showHomeScreen = false

    @available(*, deprecated)
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("BackgroundBeige"),
                        Color("VintageGold").opacity(0.3),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)

                    Text("AntiqhuB")
                        .font(.custom("Playfair9pt-Regular", size: 40))
                        .tracking(2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("DarkBrown"))
                    
                    Rectangle()
                            .fill(Color("VintageGold").opacity(0.6))
                            .frame(width: 120, height: 2)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUser))

                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPass))

                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("VintageGreen"))
                    .cornerRadius(30)

                    NavigationLink(
                        destination: ContentView(),
                        isActive: $showHomeScreen
                    ) {
                        EmptyView()
                    }.hidden()
                }
            }
        }
    }

    func authenticateUser(username: String, password: String) {
        guard let user = mockUsers.first(where: { $0.username == username })
        else {
            wrongUser = 1
            return
        }
        wrongUser = 0
        let hashedAttempt = LoginType.sha256(password)
        if hashedAttempt == user.passwordHash {
            wrongPass = 0
            showHomeScreen = true
        } else {
            wrongPass = 1
        }
    }

}

#Preview {
    LoginView()
}

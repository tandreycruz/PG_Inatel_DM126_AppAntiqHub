//
//  LoginView.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUser = 0
    @State private var wrongPass = 0

    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isRegisterMode: Bool = false

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
                    Image("iconeAntiqHub")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)

                    Text("AntiqhuB")
                        .font(.custom("Playfair9pt-Regular", size: 40))
                        .tracking(2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("DarkBrown"))

                    Rectangle()
                        .fill(Color("VintageGold").opacity(0.6))
                        .frame(width: 120, height: 2)

                    TextField(
                        isRegisterMode ? "New Username" : "Username",
                        text: $username
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUser))

                    SecureField(
                        isRegisterMode ? "New Password" : "Password",
                        text: $password
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPass))

                    if isRegisterMode {
                        Button("Cadastrar") {
                            registerUser(username: username, password: password)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("VintageGold"))
                        .cornerRadius(30)
                        .alert(alertMessage, isPresented: $showAlert) {
                            Button("OK", role: .cancel) {}
                        }
                    } else {
                        Button("Login") {
                            authenticateUser(
                                username: username, password: password)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("VintageGreen"))
                        .cornerRadius(30)
                    }

                    Button(
                        isRegisterMode
                            ? "Já tem conta? Fazer Login"
                            : "Novo usuário? Cadastre-se"
                    ) {
                        isRegisterMode.toggle()

                        wrongUser = 0
                        wrongPass = 0
                    }
                    .foregroundColor(Color("VintageGold"))
                    .padding(.top, 10)

                }
            }
        }
    }

    func authenticateUser(username: String, password: String) {

        //guard let user = mockUsers.first(where: { $0.username == username })
        //else {
        guard
            let user = userManager.usuarios.first(where: {
                $0.username == username
            })
        else {
            wrongUser = 1
            return
        }

        wrongUser = 0
        let hashedAttempt = LoginType.sha256(password)
        if hashedAttempt == user.passwordHash {
            wrongPass = 0
            userManager.isLoggedIn = true
            userManager.usuarioAtual = username
        } else {
            wrongPass = 1
        }
    }

    func registerUser(username: String, password: String) {
        guard !userManager.usuarios.contains(where: { $0.username == username })
        else {
            wrongUser = 1
            alertMessage = "Usuário já existe."
            showAlert = true

            return
        }

        userManager.adicionarUsuario(nome: username, senha: password)
        wrongUser = 0
        wrongPass = 0
        userManager.isLoggedIn = true
        userManager.usuarioAtual = username
        alertMessage = "Usuário cadastrado com sucesso!"
        showAlert = true
    }

}

#Preview {
    LoginView().environmentObject(UserManager())
}

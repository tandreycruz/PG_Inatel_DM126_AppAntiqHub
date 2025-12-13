//
//  NavigationBar.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//


import SwiftUI

struct NavigationBar: View {
    @ObservedObject var userManager: UserManager
    
    @State private var nomeAtual: String = ""
    @State private var nomes: [String] = []
    @State private var showAlert: Bool = false
    @State private var nomeNovo: String = ""
    @State private var senhaNova: String = ""
    
    init(userManager: UserManager) {
        self.userManager = userManager
        _nomes = State(initialValue: userManager.usuarios.map { $0.username })
        _nomeAtual = State(initialValue: userManager.usuarios.first?.username ?? "Usuário")
    }

    
    var body: some View {
        HStack{
            Menu{
                ForEach(nomes, id: \.self){
                    nome in
                    Button(nome)
                    {
                        nomeAtual = nome
                    }
                }
            }label: {
                Text(nomeAtual)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkBrown"))
            }
            
            Button(action: {showAlert = true}){
                Image(systemName: "plus.circle.fill")
            .font(.title3)
            .foregroundColor(Color("VintageGreen"))
            }
            .sheet(isPresented: $showAlert){
                VStack{
                    Text("Adicionar novo usuario")
                        .font(.headline)
                        .foregroundColor(Color("DarkBrown"))

                    TextField("Digite o nome", text: $nomeNovo)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Digite a senha", text: $senhaNova)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    
                    HStack {
                        Button("Cancelar") {
                            showAlert = false
                            nomeNovo = ""
                            senhaNova = ""
                        }
                        .foregroundColor(Color("DarkBrown"))
                        
                        Button("Adicionar") {
                            if !nomeNovo.isEmpty && !senhaNova.isEmpty {
                                userManager.adicionarUsuario(nome: nomeNovo, senha: senhaNova)
                                nomes.append(nomeNovo)
                                nomeAtual = nomeNovo
                                nomeNovo = ""
                                senhaNova = ""
                                showAlert = false
                            }

                        }
                        .foregroundColor(Color("VintageGreen"))
                    }
                }
                .presentationDetents([.fraction(0.2)])
                .padding()
                .background(Color("BackgroundBeige"))
            }
        }
        .padding()
        .background(Color("BackgroundBeige"))
    }
}

#Preview {
    NavigationBar(userManager: UserManager())
}

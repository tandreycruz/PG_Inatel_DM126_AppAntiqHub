//
//  NavigationBar.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var userManager: UserManager
    @State private var showNewAntique = false
    @State private var nomeAtual: String = ""
    @State private var nomes: [String] = []

    var body: some View {
        HStack {
            // Menu de seleção de usuário logado
            Menu {
                ForEach(nomes, id: \.self) { nome in
                    Button(nome) {
                        nomeAtual = nome
                        userManager.usuarioAtual = nome
                    }
                }
            } label: {
                Text(nomeAtual)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkBrown"))
            }

            // ✅ Botão para novo anúncio
            Button(action: { showNewAntique = true }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                    .foregroundColor(Color("VintageGreen"))
            }
            .sheet(isPresented: $showNewAntique) {
                AntiqueNewView()
                    .environmentObject(userManager)
            }

            // Botão de logout
            Button(action: {
                userManager.isLoggedIn = false
                userManager.usuarioAtual = nil
            }) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.title3)
                    .foregroundColor(Color("VintageGreen"))
            }
        }
        .padding()
        .background(Color("BackgroundBeige"))
        .onAppear {
            nomes = userManager.usuarios.map { $0.username }
            nomeAtual = userManager.usuarioAtual ?? (userManager.usuarios.first?.username ?? "Usuário")
        }
    }
}

#Preview {
    NavigationBar().environmentObject(UserManager())
}

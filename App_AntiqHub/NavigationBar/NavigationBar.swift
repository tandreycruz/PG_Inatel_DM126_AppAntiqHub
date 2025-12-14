//
//  NavigationBar.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var antiqueManager: AntiqueManager

    @State private var showNewAntique = false
    @State private var nomeAtual: String = ""
    @State private var nomes: [String] = []

    var body: some View {
        HStack {
            if let usuario = userManager.usuarioAtual {
                let count = antiqueManager.antiques.filter { $0.usuario == usuario }.count

                Text("\(usuario) (Qtde. Publicações: \(count))")                
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkBrown"))
            }

            Spacer()

            Button(action: { showNewAntique = true }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                    .foregroundColor(Color("VintageGreen"))
            }
            .sheet(isPresented: $showNewAntique) {
                AntiqueNewView()
                    .environmentObject(userManager)
            }

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
            nomeAtual =
                userManager.usuarioAtual
                ?? (userManager.usuarios.first?.username ?? "Usuário")
        }
    }
}

#Preview {
    NavigationBar().environmentObject(UserManager())
}

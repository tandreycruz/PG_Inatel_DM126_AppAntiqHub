//
//  AntiqueContainer.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/13/25.
//

import SwiftUI

struct AntiqueContainer: View {
    @EnvironmentObject var antiqueManager: AntiqueManager
    @EnvironmentObject var userManager: UserManager
    @State private var showDeleteAlert = false
    @State private var showBuyAlert = false
    @State private var showPermissionAlert = false
    @State private var selectedAntique: AntiqueType?

    var body: some View {
        List {
            ForEach(antiqueManager.antiques) { antique in
                NavigationLink(destination: AntiqueDetailView(antique: antique)) {
                    AntiqueListView(antique: antique)
                }
                .listRowBackground(Color.clear)
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        selectedAntique = antique
                        if antique.usuario == userManager.usuarioAtual {
                            showDeleteAlert = true
                        } else {
                            showPermissionAlert = true
                        }
                    } label: {
                        Label("Excluir", systemImage: "trash")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        selectedAntique = antique
                        showBuyAlert = true
                    } label: {
                        Label("Comprar", systemImage: "cart")
                    }
                    .tint(.green)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("BackgroundBeige"),
                    Color("VintageGold").opacity(0.2)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        // Alerta de exclusão
        .alert("Confirmar Exclusão", isPresented: $showDeleteAlert) {
            Button("Cancelar", role: .cancel) {}
            Button("Excluir", role: .destructive) {
                if let antique = selectedAntique {
                    antiqueManager.removerAntique(antique)
                }
            }
        } message: {
            Text("Deseja realmente excluir este anúncio?")
        }
        // Alerta de compra
        .alert("Confirmar Compra", isPresented: $showBuyAlert) {
            Button("Cancelar", role: .cancel) {}
            Button("Confirmar") {
                if let antique = selectedAntique {
                    antiqueManager.marcarComoComprado(antique)
                }
            }
        } message: {
            Text("Deseja marcar este item como comprado?")
        }
        // Alerta de permissão
        .alert("Ação não permitida", isPresented: $showPermissionAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Você só pode excluir anúncios que você mesmo cadastrou.")
        }
    }
}

#Preview {
    NavigationStack {
        AntiqueContainer()
            .environmentObject(AntiqueManager())
            .environmentObject(UserManager())
    }
}

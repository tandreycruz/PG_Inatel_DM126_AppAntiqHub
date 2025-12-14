//
//  AntiqueListView.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/13/25.
//

import SwiftUI

struct AntiqueListView: View {
    let antique: AntiqueType

    var body: some View {
        HStack(spacing: 15) {
            Image(antique.imagemPrincipal)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {
                Text(antique.nomeItem)
                    .font(.headline)
                    .foregroundColor(Color("DarkBrown"))

                Text("Ano: \(antique.anoFabricacao)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("R$ \(antique.preco, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(Color("VintageGreen"))
                
                Text("Vendedor: \(antique.usuario)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(12)
        .shadow(color: Color("VintageGold").opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    AntiqueListView(
        antique: AntiqueType(
            nomeItem: "Relógio de Bolso Antigo",
            descricao: "Relógio suíço de 1920, funcionando perfeitamente.",
            anoFabricacao: 1920,
            preco: 1200.0,
            imagemPrincipal: "relogio_bolso",
            todasImagens: ["relogio_bolso", "relogio_detalhe"],
            usuario: "taibe"))
}

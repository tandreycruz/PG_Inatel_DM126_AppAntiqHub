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
                .shadow(radius: 3)

            VStack(alignment: .leading, spacing: 6) {
                Text(antique.nomeItem)
                    .font(.custom("PlayfairDisplay-Regular", size: 22))
                    .foregroundColor(Color("DarkBrown"))
                    .fontWeight(.bold)

                Text("Ano: \(antique.anoFabricacao)")
                    .font(.subheadline)
                    .foregroundColor(Color("VintageGreen"))

                Text("R$ \(antique.preco, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(Color("VintageGold"))
                    .fontWeight(.semibold)

                Text("Vendedor: \(antique.usuario)")
                    .font(.footnote)
                    .foregroundColor(Color("DarkBrown").opacity(0.7))

                if antique.comprado {
                    HStack(spacing: 6) {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.green)
                            .clipShape(Circle())

                        Text("Comprado")
                            .font(.headline)
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 6)
                }
            }
            Spacer()
        }
        .padding()
        .background(
            antique.comprado
                ? Color.green.opacity(0.25)
                : Color("BackgroundBeige").opacity(0.9)
        )
        .cornerRadius(12)
        .shadow(color: Color("VintageGold").opacity(0.4), radius: 5, x: 0, y: 3)
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
            usuario: "taibe",
            comprado: true
        )
    )
}

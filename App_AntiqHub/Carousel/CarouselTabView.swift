//
//  CarouselTabView.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/13/25.
//


import SwiftUI

struct CarouselTabView: View {
    let antique: AntiqueType

    var body: some View {
        TabView {
            ForEach(antique.todasImagens, id: \.self) { imagem in
                Image(imagem)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .shadow(color: Color("VintageGold").opacity(0.4), radius: 6, x: 0, y: 3)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 300)
    }
}

#Preview {
    CarouselTabView(antique: AntiqueType(
        nomeItem: "Relógio Suíço de Bolso",
        descricao:
            "Relógio suíço de 1920, cor em bronze, presente familiar com origem em integrante da família real dinamarquesa, funcionando perfeitamente.",
        anoFabricacao: 1920,
        preco: 1200.0,
        imagemPrincipal: "relogio_bolso",
        todasImagens: [
            "relogio_bolso", "relogio_bolso2", "relogio_bolso3",
            "relogio_bolso4", "relogio_bolso5",
            "relogio_bolso6", "relogio_bolso7", "relogio_bolso8",
        ],
        usuario: "taibe"
    )
)
}

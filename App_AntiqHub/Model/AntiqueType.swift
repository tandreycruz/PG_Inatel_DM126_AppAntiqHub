//
//  AntiqueType.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/13/25.
//

import Foundation

struct AntiqueType: Identifiable {
    let id = UUID()
    let nomeItem: String
    let descricao: String
    let anoFabricacao: Int
    let preco: Double
    let imagemPrincipal: String          // nome da imagem no Assets
    let todasImagens: [String]           // array com nomes das imagens adicionais
    let usuario: String                  // username do dono da antiguidade
}

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
    let imagemPrincipal: String
    let todasImagens: [String]
    let usuario: String
    var comprado: Bool = false
}

//
//  DataSourceMock.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import Foundation

/*
let servicesMock : [ServiceType] = [
    ServiceType(id: 1, nome: "Exercitar", imagem: "exercicio"),
    ServiceType(id: 2, nome: "Meditar", imagem: "medit"),
    ServiceType(id: 3, nome: "Alongamento", imagem: "alongamento"),
    ServiceType(id: 4, nome: "Coffee Time", imagem: "coffee"),
    ServiceType(id: 5, nome: "Pausa 5min", imagem: "conversa"),
    ServiceType(id: 6, nome: "Nutricionista", imagem: "nutricionista")
]

let carouselMock : [ServiceType] = [
    ServiceType(id: 1, nome: "Bora!", imagem: "motivacional1"),
    ServiceType(id: 2, nome: "Hoje eh dia!", imagem: "motivacional2"),
    ServiceType(id: 3, nome: "Bom dia!", imagem: "motivacional3"),
    ServiceType(id: 4, nome: "Hora do cafe", imagem: "coffee")
]
*/

let mockUsers: [LoginType] = [
    LoginType(username: "taibe", password: "pass888"),
    LoginType(username: "tiopatinhas", password: "pass111"),
    LoginType(username: "ronaldo", password: "pass999")
]

let mockAntiques: [AntiqueType] = [
    AntiqueType(
        nomeItem: "Relógio Suíço de Bolso",
        descricao: "Relógio suíço de 1920, cor em bronze, presente familiar com origem em integrante da família real dinamarquesa, funcionando perfeitamente.",
        anoFabricacao: 1920,
        preco: 1200.0,
        imagemPrincipal: "relogio_bolso",
        todasImagens: ["relogio_bolso", "relogio_bolso2", "relogio_bolso3", "relogio_bolso4", "relogio_bolso5",
                       "relogio_bolso6", "relogio_bolso7", "relogio_bolso8"],
        usuario: "taibe"
    ),
    AntiqueType(
        nomeItem: "Camisa Barcelona 96/97",
        descricao: "Camisa autografada do Barcelona, coleção pessoal.",
        anoFabricacao: 1996,
        preco: 1800.0,
        imagemPrincipal: "camisa_barcelona",
        todasImagens: ["camisa_barcelona", "camisa_barcelona2", "camisa_barcelona3"],
        usuario: "ronaldo"
    ),
    AntiqueType(
        nomeItem: "Moeda Medieval Portugal",
        descricao: "Moeda rara de Portugal, D. Joao I (1385-1433), meio Real de 10 Soldos, excelente estado de conservação.",
        anoFabricacao: 1385,
        preco: 2500.0,
        imagemPrincipal: "moeda_rara",
        todasImagens: ["moeda_rara", "moeda_rara2", "moeda_rara3", "moeda_rara4"],
        usuario: "tiopatinhas"
    ),
    AntiqueType(
        nomeItem: "Moeda Medieval França",
        descricao: "Moeda rara da França, King Charles IV (1322-1328), Maille Blanche 1MB Prata, excelente estado de conservação.",
        anoFabricacao: 1322,
        preco: 2800.0,
        imagemPrincipal: "moeda_franca",
        todasImagens: ["moeda_franca", "moeda_franca2", "moeda_franca3", "moeda_franca4"],
        usuario: "tiopatinhas"
    ),
    AntiqueType(
        nomeItem: "Vitrola Clássica",
        descricao: "Vitrola dos anos 50, edição especial limitada, ainda toca discos de vinil.",
        anoFabricacao: 1955,
        preco: 1800.0,
        imagemPrincipal: "vitrola_retro",
        todasImagens: ["vitrola_retro", "vitrola_retro2", "vitrola_retro3", "vitrola_retro4"],
        usuario: "taibe"
    ),
    AntiqueType(
        nomeItem: "Camisa Seleção Brasileira 70",
        descricao: "Camisa autografada da seleção brasileira, Copa do Mundo do México 1970, um presente de João Havelange, coleção pessoal.",
        anoFabricacao: 1970,
        preco: 2500.0,
        imagemPrincipal: "camisa_selecao70",
        todasImagens: ["camisa_selecao70", "camisa_selecao70_2"],
        usuario: "ronaldo"
    ),
    AntiqueType(
        nomeItem: "Camisa Corinthians 77",
        descricao: "Camisa autografada do S.C. Corinthians Paulista, Campeão Paulista 1977, um presente de Basílio, coleção pessoal.",
        anoFabricacao: 1977,
        preco: 8800.0,
        imagemPrincipal: "camisa_corinthians",
        todasImagens: ["camisa_corinthians", "camisa_corinthians2"],
        usuario: "ronaldo"
    )
]

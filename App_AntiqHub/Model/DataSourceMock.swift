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

let goalsMock: [GoalType] = [
    GoalType(id: 1, icone: "moon.zzz.fill", titulo: "Descanso", descricao: "Dormir 8h por noite"),
    GoalType(id: 2, icone: "hare.fill", titulo: "Exercicio", descricao: "Correr 2km duas vezes por semana"),
    GoalType(id: 3, icone: "goforward.60", titulo: "Redes Sociais", descricao: "Usar o celular por apenas 4h")
]
*/

let mockUsers: [LoginType] = [
    LoginType(username: "taibe", password: "pass888"),
    LoginType(username: "tiopatinhas", password: "pass111"),
    LoginType(username: "ronaldo", password: "pass999")
]

let mockAntiques: [AntiqueType] = [
    AntiqueType(
        nomeItem: "Relógio de Bolso Antigo",
        descricao: "Relógio suíço de 1920, funcionando perfeitamente.",
        anoFabricacao: 1920,
        preco: 1200.0,
        imagemPrincipal: "relogio_bolso",
        todasImagens: ["relogio_bolso", "relogio_detalhe"],
        usuario: "taibe"
    ),
    AntiqueType(
        nomeItem: "Moeda Rara",
        descricao: "Moeda de prata do Império Romano, excelente estado de conservação.",
        anoFabricacao: 180,
        preco: 2500.0,
        imagemPrincipal: "moeda_romana",
        todasImagens: ["moeda_romana", "moeda_detalhe"],
        usuario: "tiopatinhas"
    ),
    AntiqueType(
        nomeItem: "Vitrola Clássica",
        descricao: "Vitrola dos anos 50, ainda toca discos de vinil.",
        anoFabricacao: 1955,
        preco: 1800.0,
        imagemPrincipal: "vitrola",
        todasImagens: ["vitrola", "vitrola_detalhe"],
        usuario: "ronaldo"
    )
]

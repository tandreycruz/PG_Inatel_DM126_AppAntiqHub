//
//  AntiqueNewView.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/13/25.
//

import SwiftUI
import PhotosUI

struct AntiqueNewView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var antiqueManager: AntiqueManager

    @Environment(\.dismiss) var dismiss

    @State private var nomeItem = ""
    @State private var descricao = ""
    @State private var anoFabricacao = ""
    @State private var preco = ""
    @State private var selectedImages: [PhotosPickerItem] = []
    @State private var uiImages: [UIImage] = []

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Informações do Item")) {
                    TextField("Nome do item", text: $nomeItem)
                    TextField("Descrição", text: $descricao)
                    TextField("Ano de fabricação", text: $anoFabricacao)
                        .keyboardType(.numberPad)
                    TextField("Preço", text: $preco)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Imagens")) {
                    PhotosPicker(
                        selection: $selectedImages,
                        maxSelectionCount: 5,
                        matching: .images
                    ) {
                        Text("Selecionar imagens")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("VintageGreen"))
                            .cornerRadius(10)
                    }

                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(uiImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }

                Section {
                    Button("Salvar Anúncio") {
                        salvarAntique()
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("VintageGold"))
                    .cornerRadius(10)
                }
            }
            .navigationTitle("Novo Anúncio")
        }
        .onChange(of: selectedImages) { oldItems, newItems in
            uiImages.removeAll()
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        uiImages.append(uiImage)
                    }
                }
            }
        }
    }

    func salvarAntique() {
        guard let usuario = userManager.usuarioAtual else { return }

        let novoAntique = AntiqueType(
            nomeItem: nomeItem,
            descricao: descricao,
            anoFabricacao: Int(anoFabricacao) ?? 0,
            preco: Double(preco) ?? 0.0,
            //imagemPrincipal: uiImages.isEmpty ? "placeholder" : "imagem_temp",
            //todasImagens: uiImages.map { _ in "imagem_temp" },
            imagemPrincipal: "teste_padrao",
            todasImagens: ["teste_padrao"],
            usuario: usuario
        )

        antiqueManager.adicionarAntique(novoAntique)
    }
}

#Preview {
    AntiqueNewView().environmentObject(UserManager())
}

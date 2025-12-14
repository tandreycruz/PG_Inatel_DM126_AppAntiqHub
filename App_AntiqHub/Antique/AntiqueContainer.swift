//
//  AntiqueContainer.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/13/25.
//

import SwiftUI

struct AntiqueContainer: View {
    //let antiques: [AntiqueType] = mockAntiques
    let antiques: [AntiqueType]

    var body: some View {
        VStack(spacing: 20) {
            ForEach(antiques) { antique in
                NavigationLink(destination: AntiqueDetailView(antique: antique))
                {
                    AntiqueListView(antique: antique)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    NavigationStack {
            AntiqueContainer(antiques: mockAntiques)
        }
}

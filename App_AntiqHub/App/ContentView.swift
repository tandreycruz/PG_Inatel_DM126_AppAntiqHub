//
//  ContentView.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var antiqueManager: AntiqueManager

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("BackgroundBeige"),
                        Color("VintageGold").opacity(0.3),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    NavigationBar()

                    VStack(spacing: 20) {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(Color("VintageGreen"))

                        Text("Bem-vindo ao AntiqHub")
                            .font(.custom("PlayfairDisplay-Regular", size: 28))
                            .foregroundColor(Color("DarkBrown"))

                        Rectangle()
                            .fill(Color("VintageGold").opacity(0.6))
                            .frame(width: 150, height: 2)

                        Text("Explore tesouros e antiguidades")
                            .font(.headline)
                            .foregroundColor(Color("VintageGreen"))

                        AntiqueContainer()
                            .environmentObject(antiqueManager)
                    }
                    .padding(.vertical)
                }

            }
        }
        .tint(Color("VintageGreen"))
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
        .environmentObject(AntiqueManager())
}

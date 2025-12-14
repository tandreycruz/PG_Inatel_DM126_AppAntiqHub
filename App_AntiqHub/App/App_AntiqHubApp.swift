//
//  App_AntiqHubApp.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//

import SwiftUI

@main
struct App_AntiqHubApp: App {
    @StateObject var userManager = UserManager()
    @StateObject var antiqueManager = AntiqueManager()

    var body: some Scene {
        WindowGroup {
            if userManager.isLoggedIn {
                ContentView()
                    .environmentObject(userManager)
                    .environmentObject(antiqueManager)
            } else {
                LoginView()
                    .environmentObject(userManager)
                    .environmentObject(antiqueManager)
            }
        }
    }
}

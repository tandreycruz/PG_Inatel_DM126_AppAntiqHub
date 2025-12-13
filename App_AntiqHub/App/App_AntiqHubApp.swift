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
    
    var body: some Scene {
        WindowGroup {
            if userManager.isLoggedIn {
                ContentView()
                    .environmentObject(userManager)
            } else {
                LoginView()
                    .environmentObject(userManager)
            }
        }
    }
}

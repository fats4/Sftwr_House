//
//  Sftwr_HouseApp.swift
//  Sftwr_House
//
//  Created by FaTs on 30/06/24.
//

import SwiftUI

@main
struct MySwiftUIAppApp: App {
    @State private var isSplashScreenActive = true
    
    var body: some Scene {
        WindowGroup {
            if isSplashScreenActive {
                SplashScreenView(isSplashScreenActive: $isSplashScreenActive)
            } else {
                MainView()
            }
        }
    }
}


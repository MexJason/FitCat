//
//  FitCatApp.swift
//  FitCat
//
//  Created by Jason Dubon on 9/3/23.
//

import SwiftUI

@main
struct FitCatApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardView()
            } else {
                HomeView()
                    .environmentObject(manager)
            }
        }
    }
}

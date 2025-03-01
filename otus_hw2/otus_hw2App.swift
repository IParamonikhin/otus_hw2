//
//  otus_hw2App.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import SwiftUI
import CoreServices

@main
struct otus_hw2App: App {
    
    init() {
        setupDependencies()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func setupDependencies() {
        ServiceLocator.shared.register(NetworkService() as NetworkServiceProtocol)
        ServiceLocator.shared.register(FilmsService() as FilmsServiceProtocol)
    }
}

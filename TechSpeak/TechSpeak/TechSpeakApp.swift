//
//  TechSpeakApp.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/8/23.
//

import SwiftUI

@main
struct TechSpeakApp: App {
    
    @StateObject private var vm = TechSentence()
    @StateObject private var cvm = CorporateSentence()

    var body: some Scene {
        MenuBarExtra {
            ContentView()
                .environmentObject(vm)
                .environmentObject(cvm)
        } label: {
            Image(systemName: "brain.head.profile")
        }
        .menuBarExtraStyle(.window)
    }
}

//
//  ContentView.swift
//  Example-SwiftUI
//
//  Created by JH on 2025/6/7.
//

import SwiftUI
import SystemSettingsNavigator

struct ContentView: View {
    
    @Environment(\.openSystemSettings)
    private var openSystemSettings
    
    var body: some View {
        VStack {
            Button {
                openSystemSettings(.privacySecurity(.extensions(.fileSystem)))
            } label: {
                Text("Open System Settings")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Example-SwiftUI
//
//  Created by JH on 2025/6/7.
//

import SwiftUI
import SystemSettingsNavigator

struct ContentView: View {
    
    @Environment(\.openSystemSetting)
    private var openSystemSetting
    
    var body: some View {
        VStack {
            Button {
                openSystemSetting(.privacySecurity(.extensions(.xcodeSourceEditor)))
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

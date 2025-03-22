//
//  SettingsView.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-15.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: {dismiss()}, label: {
                    Image(systemName: "xmark")
                        .padding(8)
                })
                .buttonStyle(.borderless)

            }
            .padding(8)
            Spacer()
            Text("No settings so far")
        }
    }
}

#Preview {
    SettingsView()
}

//
//  AboutView.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-10.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) var dismiss
    let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("About")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "xmark")
                            .padding(8)
                    })
                    .buttonStyle(.borderless)
                }
                Spacer()
            }
            .padding(8)
            HStack(spacing: 32) {
                Image(nsImage: NSImage(named: "AppIcon")!)
                    .frame(width: 64, height: 64)
                VStack {
                    Text("Bears, Beets, Quotes!").font(.title)
                    Text("by Pavel Makhov").font(.caption)
                    Text("version " + currentVersion).font(.footnote)
                    
                    HStack {
                        Button(action: {
                            openURL(URL(string:"https://menubar-apps.github.io/#todobar")!)
                        }) {
                            Image(systemName: "house.fill")
                        }
                        .buttonStyle(.borderless)
                        .padding(4)
                        .help("Home page")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 1)
                        )
                        
                        Button(action: {
                            openURL(URL(string:"https://github.com/menubar-apps/ToDoBar/issues/new?template=feature_request.md")!)
                        }) {
                            
                            Image(systemName: "star.fill")
                        }
                        .buttonStyle(.borderless)
                        .padding(4)
                        .help("Request a feature")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 1)
                        )
                        
                        Button(action: {
                            openURL(URL(string:"https://github.com/menubar-apps/ToDoBar/issues/new?template=bug_report.md")!)
                        }) {
                            Image(systemName: "ladybug.fill")
                        }
                        .buttonStyle(.borderless)
                        .padding(4)
                        .help("Report a bug")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 1)
                        )
                    }
                }
            }
        }
        Spacer()
    }
}

#Preview {
    AboutView()
}

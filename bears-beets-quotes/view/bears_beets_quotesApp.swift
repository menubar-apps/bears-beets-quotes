//
//  bears_beets_quotesApp.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-10.
//

import SwiftUI

@main
struct bears_beets_quotesApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        MenuBarExtra (content: {
            NavigationStack {
                ZStack {
                    VStack {
                        HStack(spacing: 16) {
                            Spacer()
                            Button(action: {viewModel.fetchQuote()}, label: { Image(systemName: "arrow.2.circlepath") } )
                                .buttonStyle(.borderless)
                            Menu {
                                NavigationLink(value: Destination.about, label: {
                                    Image(systemName: "info.circle")
                                    Text("About")
                                })
                                
//                                NavigationLink(value: Destination.settings, label: {
//                                    Image(systemName: "gear")
//                                    Text("Settings")
//                                })
                                Divider()
                                Button(action: {
                                    NSApplication.shared.terminate(nil)
                                }) {
                                    Label("Quit", systemImage: "books.vertical")
                                }
                            } label: {
                                Image(systemName: "line.horizontal.3")
                            }
                            .labelsHidden()
                            .scaledToFit()
                            .menuStyle(BorderlessButtonMenuStyle())
                            .menuIndicator(.hidden)
                            .frame(width: 16, height: 16)
                            .contentShape(Rectangle())
                        }
                        Spacer()
                    }
                    .padding()
                    
                    QuoteView(viewModel: viewModel)
                        .onAppear {
                            viewModel.fetchQuote()
                        }
                    Spacer()
                }
                .navigationDestination(for: Destination.self) { dest in
                    switch dest {
                    case .about:
                        AboutView()
                            .frame(height: 200)
                    case .settings:
                        SettingsView()
                    }
                }
                .navigationBarBackButtonHidden()
            }
            .frame(width: 400, height: 200)
        }, label: {
            let image: NSImage = {
                let ratio = $0.size.height / $0.size.width
                $0.size.height = 20
                $0.size.width = 20 / ratio
                return $0
            }(NSImage(named: "traced-bear")!)
            
            Image(nsImage: image)
                .renderingMode(.template)
        })
        .menuBarExtraStyle(.window)
    }
}

enum Destination {
    case about, settings
}

//
//  ViewModel.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-15.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var quote: CharacterQuote?
    private var client = QuoteClient()
    
    func fetchQuote() {
        client.getRandomQuote { q in
            DispatchQueue.main.async {
                self.quote = q
            }
        }
    }
    
}



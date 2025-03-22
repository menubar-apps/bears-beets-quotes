//
//  QuoteView.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-10.
//

import SwiftUI

struct QuoteView: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            if let quote = viewModel.quote {
                HStack {
//                    AsyncImage(url: quote.characterAvatarURL) { image in
//                        image.resizable()
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    .frame(width: 100, height: 100)
//                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text(quote.character)
                            .font(.headline)
                        Text(quote.quote)
                            .italic()
                            .lineLimit(12)
                    }
                    .padding()
                    Spacer()
                }
            } else {
                Text("Loading quote...")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

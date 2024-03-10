//
//  CurrencySelectionView.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 10/03/24.
//

import SwiftUI

struct CurrencySelectionView: View {
    let image: ImageResource
    let text: String
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency Image
            Image(image)
                .resizable()
                .scaledToFit()
            // Text
            Text(text)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}


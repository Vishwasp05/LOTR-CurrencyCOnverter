//
//  IconGrid.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 11/03/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding  var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencySelectionView(image: currency.image, text: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }
                else {
                    CurrencySelectionView(image: currency.image, text: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}

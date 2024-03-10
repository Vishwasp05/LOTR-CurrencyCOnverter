//
//  SelectCurrencyView.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 10/03/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                //txt
                Text("Select the currency you're starting with: ")
                    .bold()
                //icon
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<5) { _ in
                        CurrencySelectionView(image: .copperpenny, text: "Copper Penny")
                    }
                }
                //text
                Text("Select the currency you'd like to convert to: ")
                    .bold()
                //Done button
                
                Button {
                    //Button action here
                    //Toggle off the showInfoScreen
                    dismiss()
                    
                } label: {
                    Text("Done")
                }
                
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.black)
                .opacity(0.6)
                .tint(.brown)
                .font(.largeTitle)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrencyView()
}



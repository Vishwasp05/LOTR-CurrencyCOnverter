//
//  ExchangeInfo.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 10/03/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown )
            VStack(spacing: 30){
                Text("Exchange Rates")
                    .font(.largeTitle.bold())
                    .tracking(3)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currrencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates: ")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .frame(width: 380)
                
                
                ConversionTextView(firstImage: .goldpiece, secondImage: .goldpenny, text: "1 Gold Piece = 4 Gold Pennies")
                ConversionTextView(firstImage: .goldpenny, secondImage: .silverpiece, text: "1 Gold Penny = 4 Silver Pieces")
                ConversionTextView(firstImage: .silverpiece, secondImage: .silverpenny, text: "1 Silver Piece = 4 Silver Pennies")
                ConversionTextView(firstImage: .silverpenny, secondImage: .copperpenny, text: "1 Silver Penny = 100 Copper Pennies")
                    
                    
                
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
            .foregroundStyle(.black)
            
        }
        
    }
    
}

#Preview {
    ExchangeInfo()
}

struct ConversionTextView: View {
    let firstImage: ImageResource
    let secondImage: ImageResource
    let text: String
    var body: some View {
        HStack{
            Image(firstImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(secondImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

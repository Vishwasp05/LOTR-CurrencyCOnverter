//
//  ContentView.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    @State private  var showExchangeInfo = false
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 10){
                // IMAGE
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // TEXT
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 370, height: 95)
                        .foregroundStyle(.white)
                        .opacity(0.15)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    HStack {
                            
                            VStack(spacing:0) {
                                HStack {
                                    Image("silverpiece")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 33)
                                        
                                    Text("Silver Piece")
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                        
                                        
                                }
                                .frame(width: 150)
                                TextField("Amount",text: $leftAmount)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 150)
                            }
                            
                            Image(systemName: "equal")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .symbolEffect(.pulse)
                            
                            
                            VStack(spacing:0) {
                                HStack {
                                    Text("Gold Piece")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                    Image("goldpiece")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 33)
                                }
                                TextField("Amount",text: $rightAmount )
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 150)
                            }
                            
                    }
                }
                    
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        // MARK: Button Action
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    
                        
                    
                }
                .padding(.trailing, 10)
            }
            
            
            
            
        }
    }
}

#Preview {
    ContentView()
}

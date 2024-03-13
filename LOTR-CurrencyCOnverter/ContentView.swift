//
//  ContentView.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 09/03/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    @State private  var showExchangeInfo = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    
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
                                Image(leftCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                
                                Text(leftCurrency.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                
                            }
                            .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                            .sheet(isPresented: $showSelectCurrency) {
                                SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                            }
                            
                            .frame(width: 150)
                            
                            TextField("Amount",text: $leftAmount)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 150)
                                .focused($leftTyping)
                                .keyboardType(.numberPad)
                                .onChange(of: leftAmount) {
                                    if leftTyping
                                    { rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                    }
                                }
                        }
                        
                        Image(systemName: "equal")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .symbolEffect(.pulse)
                        
                        
                        VStack(spacing:0) {
                            HStack {
                                Text(rightCurrency.name)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                Image(rightCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                            }
                            .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                            TextField("Amount",text: $rightAmount )
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 150)
                                .focused($rightTyping)
                                .keyboardType(.numberPad)
                                .onChange(of: rightAmount) {
                                    if rightTyping {
                                        leftAmount = rightCurrency.convert(rightAmount , to: leftCurrency)
                                    }
                                }
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
        .task {
            try? Tips.configure()  
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount , to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount , to: rightCurrency)
        }

    }
}

#Preview {
    ContentView()
}

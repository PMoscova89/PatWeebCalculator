//
//  MainView.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct MainView: View {
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftTyping: Bool = false
    @State var rightTyping: Bool = false
    @AppStorage("leftCurrencyRaw") private var leftCurrencyRaw: Double = Currency.dollar.rawValue
    @AppStorage("rightCurrencyRaw") private var rightCurrencyRaw: Double = Currency.yen.rawValue
    
    var leftCurrency: Currency {
        get { Currency(rawValue: leftCurrencyRaw) ?? .dollar }
        set { leftCurrencyRaw = newValue.rawValue}
    }
    
    var rightCurrency: Currency {
        get { Currency(rawValue: rightCurrencyRaw) ?? .yen }
        set { rightCurrencyRaw = newValue.rawValue }
    }
    
    private var leftCurrencyBinding: Binding<Currency> {
        Binding {
            leftCurrency
        } set: { theNewValue in
            leftCurrencyRaw = theNewValue.rawValue
        }

    }
    
    private var rightCurrencyBinding: Binding<Currency> {
        Binding {
            rightCurrency
        } set: { theNewValue in
            rightCurrencyRaw = theNewValue.rawValue
        }

    }
    
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    var body: some View {
        
        
        ZStack {
            //Background image
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    leftTyping = false
                    rightTyping = false
                }
            VStack {
                // Main Logo
                Image(.mainIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                    .colorMultiply(.blue)
                
                // Title
                Text("Currency Converter")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue.mix(with: .black, by: 0.75))
                    .shadow(color:.white, radius: 10)
                    .background(.black.opacity(0.25))
                    .clipShape(.rect(cornerRadius: 25))
                HStack {
                    // Left conversion thing
                    CurrencyConversionView(currency: leftCurrencyBinding, amount: $leftAmount, isShowingCurrencyPicker: $showSelectCurrency, isFocused: $leftTyping)
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.blue.mix(with: .black, by: 0.75))
                        .symbolEffect(.pulse)
                    //Right conversion section
                    CurrencyConversionView(currency: rightCurrencyBinding, amount: $rightAmount, isShowingCurrencyPicker: $showSelectCurrency, isFocused: $rightTyping)
                    
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.blue.mix(with: .black, by: 0.75))
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
            }
            .onChange(of: leftAmount) {
                if leftTyping == true {
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            .onChange(of: leftCurrency) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency) {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrencyView(topCurrency: leftCurrencyBinding, bottomCurrency: rightCurrencyBinding)
            }
        }
    }
}

#Preview {
    MainView()
}

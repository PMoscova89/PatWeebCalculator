//
//  CurrencyConversionView.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct CurrencyConversionView: View {
    @Binding var currency: Currency
    @Binding var amount: String
    @Binding var isShowingCurrencyPicker: Bool
    
    @Binding var isFocused: Bool
    @FocusState private var isAmountFieldFocused: Bool
    var body: some View {
        VStack{
            //Currency
            HStack {
                //CurrencyImage
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                //CurrencyText
                Text(currency.name)
                    .font(.headline)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                isShowingCurrencyPicker.toggle()
            }
            //TextField
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($isAmountFieldFocused)
                .keyboardType(.decimalPad)
                .onChange(of: isAmountFieldFocused) { isFocused = $0}
                .onChange(of: isFocused) {
                    isAmountFieldFocused = $0
                }
            
        }
    }
}


#Preview {
    @Previewable @State var currency: Currency = .dollar
    @Previewable @State var amount: String = "100"
    @Previewable @State var isShowingCurrencyPicker: Bool = false
    @Previewable @State var isFocused: Bool = false
    
    CurrencyConversionView(currency: $currency, amount: $amount, isShowingCurrencyPicker: $isShowingCurrencyPicker, isFocused: $isFocused)
}

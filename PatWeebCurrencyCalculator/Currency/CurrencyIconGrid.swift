//
//  CurrencyIconGrid.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct CurrencyIconGrid: View {
    @Binding var selectedCurrency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if currency == selectedCurrency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black.mix(with: .cyan, by: 0.7), radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var selectedCurrency: Currency = .dollar
    CurrencyIconGrid(selectedCurrency: $selectedCurrency)
}

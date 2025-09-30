//
//  CurrencyIcon.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct CurrencyIcon : View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.blue.mix(with: .black, by: 0.5).opacity(0.75))
                .foregroundStyle(.white)
        }
        .padding(3)
        .font(.caption)
        .frame(width: 100, height: 100)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .dollar, currencyName: Currency.dollar.name)
}

//
//  ExchangeRate.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text : String
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .dollar, rightImage: .yen, text: "1 US Dollar ≈ 149 Yen")
}

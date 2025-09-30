//
//  ExchangeInfo.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            //background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .background(.background)
            VStack {
                // Title text
                Text("Exchange Rates")
                    .font(.title)
                    .tracking(2)
                //Description text
                Text("""
                    Welcome, traveler! Whether you’re fresh off the Going Merry, just finished training under the heavenly demon, or shopping in Shibuya — you’ll need to know how your cash stacks up. Below is a simple guide to convert between real-world money and some of the most infamous currencies in manga.
                    """)
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
                .shadow(color: .white ,radius: 20)
                .background(.blue.opacity(0.75))
                .foregroundStyle(.black)
                .clipShape(.rect(cornerRadius: 12))
                //Exchange rates
                
                //Exchange rate
                ExchangeRate(leftImage: .dollar, rightImage: .yen, text: "1 US Dollar ≈ 149 Yen")
                    .shadow(color: .white, radius: 20)
                    .background(.blue.mix(with: .white, by: 0.4).opacity(0.54))
                    .clipShape(.buttonBorder)
                //Exchange rate
                ExchangeRate(leftImage: .dollar, rightImage: .wan, text: "1 US Dollar ≈ 1401 Won")
                    .shadow(color: .white, radius: 20)
                    .background(.blue.opacity(0.54))
                    .clipShape(.buttonBorder)
                //Exchange rate
                ExchangeRate(leftImage: .dollar, rightImage: .berry, text: "1 US Dollar ≈ 7 Berries")
                    .shadow(color: .white, radius: 20)
                    .background(.blue.opacity(0.54))
                    .clipShape(.buttonBorder)
                //Done
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue.mix(with: .white, by: 0.4))
                .font(.largeTitle)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ExchangeInfo()
}

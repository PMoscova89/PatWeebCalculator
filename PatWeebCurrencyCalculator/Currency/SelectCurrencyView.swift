//
//  SelectCurrencyView.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    @Environment(\.dismiss) var dismiss
    var body: some View {
       ZStack {
           Image(.background)
               .resizable()
               .ignoresSafeArea()
               .background(.blue.opacity(0.2))
           
           VStack{
               //Text
               Text("Select the currency you are starting with:")
                   .fontWeight(.black)
                   .shadow(color: .white, radius: 21 )
                   .multilineTextAlignment(.center)
                   .background(.black.mix(with: .cyan, by: 0.5).opacity(0.4))
                   .clipShape(RoundedRectangle(cornerRadius: 12))
               
               //IconGrid
               CurrencyIconGrid(selectedCurrency: $topCurrency)
               //More Text
               Text("Select the currency you would like to convert to:")
                   .fontWeight(.black)
                   .shadow(color: .white, radius: 21 )
                   .multilineTextAlignment(.center)
                   .background(.black.mix(with: .cyan, by: 0.5).opacity(0.4))
                   .clipShape(RoundedRectangle(cornerRadius: 12))
               //Icon Grid
               CurrencyIconGrid(selectedCurrency: $bottomCurrency)
               //Done Button
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
    @Previewable @State var topCurrency: Currency = .dollar
    @Previewable @State var bottomCurrentcy: Currency = .yen
    SelectCurrencyView(topCurrency: $topCurrency, bottomCurrency: $bottomCurrentcy)
}

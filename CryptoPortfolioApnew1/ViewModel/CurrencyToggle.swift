//
//  CurrencyToggle.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI
struct AnimatedCurrencyToggle: View {
    @Binding var selectedCurrency: PortfolioManager.Currency
    @Namespace private var toggleAnimation
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(PortfolioManager.Currency.allCases, id: \.self) { currency in
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.3)) {
                        selectedCurrency = currency
                    }
                }) {
                    Image(systemName: currency == .inr ? "banknote" : "bitcoinsign.circle")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(selectedCurrency == currency ? .black : .white.opacity(0.7))
                        .frame(width: 40, height: 32)
                        .scaleEffect(selectedCurrency == currency ? 1.1 : 1.0)
                        .background(
                            ZStack {
                                if selectedCurrency == currency {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white)
                                        .matchedGeometryEffect(id: "TOGGLE_BACKGROUND", in: toggleAnimation)
                                        .shadow(color: .white.opacity(0.3), radius: 4, x: 0, y: 2)
                                }
                            }
                        )
                        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: selectedCurrency)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
        )
    }
}




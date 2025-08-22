//
//  AssetCard.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI

    struct AssetCard: View {
        let asset: CryptoAsset
        
        var body: some View {
            GeometryReader { geometry in
                let baseFontSize = max(12, min(18, geometry.size.width * 0.08))
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        // Asset icon
                        ZStack {
                            Circle()
                                .fill(asset.symbol == "BTC" ? Color.orange : Color.white)
                                .frame(width: 40, height: 40)
                            
                            if asset.symbol == "BTC" {
                                Image("bitcoin")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            } else {
                                Image("ether")
                                                               .resizable()
                                                               .scaledToFit()
//                                                               .frame(width: 16, height: 16)
                                                               .clipShape(Circle())
                            }
                        }
                        
                        Text(asset.name)
                            .font(.system(size: baseFontSize, weight: .semibold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)  // Can scale down to 40%
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 8) {
                        Text("₹ \(formatNumber(asset.value))")
                            .font(.system(size: baseFontSize - 1, weight: .semibold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                        
                        Text("+\(asset.changePercent, specifier: "%.1f")%")
                            .font(.system(size: baseFontSize - 2, weight: .medium))
                            .foregroundColor(.green)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                }
                .padding(max(12, geometry.size.width * 0.06))
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                )
            }
            .frame(height: 120)
        }
        
        private func formatNumber(_ number: Double) -> String {
            if number >= 100000 {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 0
                return formatter.string(from: NSNumber(value: number)) ?? "\(Int(number))"
            } else {
                return String(format: "%.2f", number)
            }
        }
    }

//
//  PortfolioView.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI

// MARK: - Portfolio View
struct PortfolioView: View {
    @EnvironmentObject var portfolioManager: PortfolioManager
    @State private var dragPosition: CGFloat = 300
    @State private var isDragging = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                portfolioHeaderSection
                timeframeSelector
                chartSection
                assetSection
                transactionSection
            }
            .padding(.bottom, 120)
        }
        .background(Color.black)
        .ignoresSafeArea(.container, edges: .top)
    }
    
    private var portfolioHeaderSection: some View {
        ZStack {
            // Background image from assets - rotated upside down
            Image("background")
                .resizable()
                .scaledToFill()
                .rotationEffect(.degrees(180))  // Rotated 180 degrees to flip upside down
                .frame(height: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .ignoresSafeArea(.container, edges: .top)
            
            VStack(spacing: 0) {
                // Top navigation
                HStack {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                Spacer()
                
                // Portfolio value section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Portfolio Value >")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Text("₹ 1,57,342.05")
                                .font(.system(size: 36, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Animated toggle-style currency buttons
                        AnimatedCurrencyToggle(selectedCurrency: $portfolioManager.selectedCurrency)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }

    
    private var timeframeSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(PortfolioManager.Timeframe.allCases, id: \.self) { timeframe in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            portfolioManager.selectedTimeframe = timeframe
                        }
                    }) {
                        Text(timeframe.rawValue)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(portfolioManager.selectedTimeframe == timeframe ? .white : .gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(portfolioManager.selectedTimeframe == timeframe ? Color.white.opacity(0.2) : Color.clear)
                                    .overlay(
                                        Capsule()
                                            .stroke(portfolioManager.selectedTimeframe == timeframe ? Color.white.opacity(0.3) : Color.clear, lineWidth: 1)
                                    )
                            )
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var chartSection: some View {
        VStack(spacing: 0) {
            WideInteractiveChart(
                data: portfolioManager.chartData,
                dragPosition: $dragPosition,
                isDragging: $isDragging
            )
            .frame(height: 200)
            .padding(.top, 10)
        }
    }
    
    private var assetSection: some View {
        HStack(spacing: 16) {
            ForEach(Array(mockAssets.prefix(2))) { asset in
                AssetCard(asset: asset)
            }
        }
        .padding(.horizontal, 20)
    }
    
    private var transactionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recent Transactions")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
            }
            
            ForEach(portfolioManager.transactions) { transaction in
                TransactionRow(transaction: transaction)
            }
        }
        .padding(.horizontal, 20)
    }
}


//
//  ExchangeView.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI
// MARK: - Exchange View
struct ExchangeView: View {
    @State private var fromAmount: String = "2.640"
    @State private var toAmount: String = "4,65,006.44"
    @State private var fromCurrency: String = "ETH"
    @State private var toCurrency: String = "INR"
    @State private var ethBalance: String = "10.254"
    @State private var inrBalance: String = "4,35,804"
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
                Text("Exchange")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 60)
            
            Spacer()
            
            // Exchange interface
            VStack(spacing: 24) {
                // Send section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Send")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    HStack(spacing: 16) {
                        // ETH icon
                        Circle()
                            .fill(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text("Ξ")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("ETH")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Text("Send")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                            }
                            
                            Text("2.640")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    
                    HStack {
                        Text("Balance")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("10.254")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                )
                
                // Exchange/Swap button
                Button(action: {}) {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 48, height: 48)
                        .background(
                            Circle()
                                .fill(Color.white.opacity(0.1))
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                        )
                }
                
                // Receive section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Receive")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    HStack(spacing: 16) {
                        // INR icon
                        Circle()
                            .fill(Color.green)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text("₹")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("INR")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Text("Receive")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                            }
                            
                            Text("₹ 4,65,006.44")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    
                    HStack {
                        Text("Balance")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("4,35,804")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                )
                
                // Exchange button
                Button(action: {}) {
                    Text("Exchange")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 28)
                                .fill(
                                    LinearGradient(
                                        colors: [Color.blue, Color.blue.opacity(0.8)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            // Exchange details at bottom
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    HStack {
                        Text("Rate")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("1 ETH = ₹ 1,76,138.80")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Spread")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("0.2%")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Gas fee")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("₹ 422.73")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.1))
                    
                    HStack {
                        Text("You will receive")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                        Spacer()
                        Text("₹ 1,75,716.07")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
        .background(Color.black)
        .ignoresSafeArea(.container, edges: .top)
    }
}

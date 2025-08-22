//
//  CustomTabBar.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//

import SwiftUI
struct CustomTabBar: View {
    @Binding var selected: Tab
    var plusTapped: () -> Void
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        LinearGradient(colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .strokeBorder(Color.white.opacity(0.2), lineWidth: 1)
                    )
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                    .shadow(color: .blue.opacity(0.4), radius: 40, x: 0, y: 0)
                
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                selected = tab
                            }
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: tab.symbol)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(selected == tab ? .white : .primary.opacity(0.7))
                                
                                Text(tab.title)
                                    .font(.system(size: 10, weight: selected == tab ? .semibold : .regular))
                                    .foregroundColor(selected == tab ? .white : .primary.opacity(0.6))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .background(
                                ZStack {
                                    if selected == tab {
                                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                                            .fill(
                                                LinearGradient(
                                                    colors: [Color.blue, Color.blue.opacity(0.8)],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .shadow(color: Color.blue.opacity(0.6), radius: 8, x: 0, y: 4)
                                            .padding(.horizontal, 3)
                                            .padding(.vertical, 3)
                                            .matchedGeometryEffect(id: "TAB_HIGHLIGHT", in: animation)
                                    }
                                }
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
            if selected == .analytics {
                Button(action: plusTapped) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .frame(width: 64, height: 64)
                    .shadow(color: .white.opacity(0.4), radius: 40, x: 0, y: 0)
                }
                .transition(.scale.combined(with: .opacity))
                .animation(.spring(), value: selected)
            }
        }
        .padding(.horizontal, 2)
        .padding(.bottom, 0)
    }
}
// MARK: - Tab Enum
enum Tab: String, CaseIterable {
    case analytics = "Analytics"
    case exchange = "Exchange"
    case record = "Record"
    case wallet = "Wallet"
    
    var title: String { rawValue }
    
    var symbol: String {
        switch self {
        case .analytics: return "chart.line.uptrend.xyaxis"
        case .exchange: return "arrow.2.circlepath"
        case .record: return "list.bullet.clipboard"
        case .wallet: return "wallet.bifold"
        }
    }
}

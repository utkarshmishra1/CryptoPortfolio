//
//  MockAssets.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI

// MARK: - Data Models
struct CryptoAsset: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let value: Double
    let changePercent: Double
    let imageName: String
    
    
    var isPositive: Bool { changePercent >= 0 }
}

struct Transaction: Identifiable {
    let id = UUID()
    let type: TransactionType
    let asset: String
    let amount: String
    let date: String
    let value: String
    
    enum TransactionType {
        case receive, send
        
        var icon: String {
            switch self {
            case .receive: return "arrow.down"
            case .send: return "arrow.up"
            }
        }
        
        var title: String {
            switch self {
            case .receive: return "Receive"
            case .send: return "Send"
            }
        }
    }
}

struct ChartPoint: Identifiable {
    let id = UUID()
    let value: Double
    let date: Date
}



// MARK: - Mock Data
let mockAssets: [CryptoAsset] = [
    CryptoAsset(name: "Bitcoin (BTC)", symbol: "BTC", value: 7562502, changePercent: 3.2, imageName: "bitcoin"),
    CryptoAsset(name: "Ether (ETH)", symbol: "ETH", value: 179102, changePercent: 3.2, imageName: "ether")
]

let mockTransactions: [Transaction] = [
    Transaction(type: .receive, asset: "BTC", amount: "+0.0002126", date: "07 March", value: "+₹15.70")
]

let mockChartData: [ChartPoint] = [
    ChartPoint(value: 100, date: Date()),
    ChartPoint(value: 120, date: Date()),
    ChartPoint(value: 110, date: Date()),
    ChartPoint(value: 140, date: Date()),
    ChartPoint(value: 157, date: Date())
]

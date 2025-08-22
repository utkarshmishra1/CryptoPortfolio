import SwiftUI
import Combine

@main
struct CryptoPortfolioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



class PortfolioManager: ObservableObject {
    @Published var portfolioValue: Double = 157342.05
    @Published var selectedCurrency: Currency = .inr
    @Published var selectedTimeframe: Timeframe = .sixMonths
    @Published var assets: [CryptoAsset] = mockAssets
    @Published var transactions: [Transaction] = mockTransactions
    @Published var chartData: [ChartPoint] = mockChartData
    
    enum Currency: String, CaseIterable {
        case inr = "₹"
        case btc = "₿"
    }
    
    enum Timeframe: String, CaseIterable {
        case oneHour = "1h"
        case eightHours = "8h"
        case oneDay = "1d"
        case oneWeek = "1w"
        case oneMonth = "1m"
        case sixMonths = "6m"
        case oneYear = "1y"
    }
}





import SwiftUI

struct ContentView: View {
    @StateObject private var portfolioManager = PortfolioManager()
    @State private var selectedTab: Tab = .analytics
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            TabView(selection: $selectedTab) {
                PortfolioView()
                    .tag(Tab.analytics)
                
                ExchangeView()
                    .tag(Tab.exchange)
                
                RecordView()
                    .tag(Tab.record)
                
                WalletView()
                    .tag(Tab.wallet)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                CustomTabBar(
                    selected: $selectedTab,
                    plusTapped: {
                        // Handle plus button tap
                    }
                )
                .padding(.horizontal)
                .padding(.bottom, 34)
            }
        }
        .environmentObject(portfolioManager)
    }
}
#Preview {
    ContentView()
}

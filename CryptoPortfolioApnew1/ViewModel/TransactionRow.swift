//
//  TransactionRow.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI
struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color.orange.opacity(0.2))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: transaction.type.icon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.orange)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(transaction.type.title)")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                
                Text(transaction.date)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(transaction.asset)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(transaction.value)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}



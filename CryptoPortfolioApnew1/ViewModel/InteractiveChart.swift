//
//  InteractiveChart.swift
//  CryptoPortfolioApnew1
//
//  Created by utkarsh mishra on 22/08/25.
//
import SwiftUI
// MARK: - Wide Interactive Chart with #151515 bars
struct WideInteractiveChart: View {
    let data: [ChartPoint]
    @Binding var dragPosition: CGFloat
    @Binding var isDragging: Bool
    
    // Updated chart configuration - more spacing, taller bars
    private let totalBars = 35
    private let barWidth: CGFloat = 48.9
    private let barSpacing: CGFloat = 8.0  // Increased spacing
    private let heightScale: CGFloat = 1.2  // 20% taller bars
    private var totalChartWidth: CGFloat {
        CGFloat(totalBars) * barWidth + CGFloat(totalBars - 1) * barSpacing
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            GeometryReader { geometry in
                ZStack {
                    // Faded overlay at bottom
                    VStack {
                        Spacer()
                        LinearGradient(
                            colors: [Color.clear, Color.black.opacity(0.6)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 60)
                    }
                    
                    // Wide bar chart with #151515 color and more spacing
                    HStack(alignment: .bottom, spacing: barSpacing) {
                        ForEach(0..<totalBars, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "151515"),           // #151515 at top
                                            Color(hex: "151515").opacity(0.9),
                                            Color(hex: "151515").opacity(0.7),
                                            Color(hex: "151515").opacity(0.5),
                                            Color(hex: "151515").opacity(0.2),
                                            Color.clear
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(
                                    width: barWidth,
                                    height: CGFloat.random(in: 48...168) * heightScale  // Taller bars
                                )
                        }
                    }
                    
                    // Green curve line
                    Path { path in
                        let points = generateWideCurvePoints(in: CGSize(width: totalChartWidth, height: geometry.size.height))
                        if let firstPoint = points.first {
                            path.move(to: firstPoint)
                            
                            for i in 1..<points.count {
                                let current = points[i]
                                let previous = points[i-1]
                                
                                let midPointX = (previous.x + current.x) / 2
                                let controlPoint1 = CGPoint(x: midPointX, y: previous.y)
                                let controlPoint2 = CGPoint(x: midPointX, y: current.y)
                                
                                path.addCurve(to: current, control1: controlPoint1, control2: controlPoint2)
                            }
                        }
                    }
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    
                    // Draggable indicator
                    ZStack {
                        // Vertical line
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 2, height: geometry.size.height - 50)
                            .position(x: dragPosition, y: geometry.size.height / 2 + 10)
                        
                        // Circle on curve
                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                            .position(x: dragPosition, y: getCurveYPosition(for: dragPosition, in: geometry.size))
                        
                        // Value display
                        VStack(alignment: .leading, spacing: 2) {
                            Text("24 March")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.gray)
                            
                            Text("₹ 1,42,340")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.black.opacity(0.8))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                                )
                        )
                        .position(x: dragPosition, y: 30)
                    }
                }
            }
            .frame(width: totalChartWidth, height: 200)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        isDragging = true
                        dragPosition = max(50, min(totalChartWidth - 100, value.location.x))
                        
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.impactOccurred()
                    }
                    .onEnded { _ in
                        isDragging = false
                    }
            )
        }
        .padding(.horizontal, 20)
    }
    
    private func generateWideCurvePoints(in size: CGSize) -> [CGPoint] {
        var points: [CGPoint] = []
        let stepX = (size.width - 40) / CGFloat(totalBars - 1)
        
        for i in 0..<totalBars {
            let x = 20 + CGFloat(i) * stepX
            let progress = Double(i) / Double(totalBars - 1)
            
            let baseY = size.height * 0.5
            let wave1 = sin(progress * Double.pi * 2.5) * 40
            let wave2 = cos(progress * Double.pi * 1.8) * 25
            let trend = -progress * 15
            
            let y = max(25, min(size.height - 40, baseY + wave1 + wave2 + trend))
            points.append(CGPoint(x: x, y: y))
        }
        
        return points
    }
    
    private func getCurveYPosition(for x: CGFloat, in size: CGSize) -> CGFloat {
        let points = generateWideCurvePoints(in: CGSize(width: totalChartWidth, height: size.height))
        
        var closestPoint = points[0]
        var minDistance = abs(points[0].x - x)
        
        for point in points {
            let distance = abs(point.x - x)
            if distance < minDistance {
                minDistance = distance
                closestPoint = point
            }
        }
        
        return closestPoint.y
    }
}



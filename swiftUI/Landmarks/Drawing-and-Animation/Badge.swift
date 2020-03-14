//
//  Badge.swift
//  Drawing-and-Animation
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        
        GeometryReader { geometry in
            Path {
                path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(to: .init(
                        x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                        y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(to: .init(
                        x: width * $0.useWidth.1 * $0.xFactors.1,
                        y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                                      control: .init(x: width * $0.useWidth.2 * $0.xFactors.2,
                                                     y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }.fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: .init(x: 0.5, y: 0.5), endPoint: .init(x: 0.5, y: 0.5)
            )).aspectRatio(1, contentMode: .fit)
        }
    }
    
    static let gradientStart = Color.yellow
    static let gradientEnd = Color.red
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

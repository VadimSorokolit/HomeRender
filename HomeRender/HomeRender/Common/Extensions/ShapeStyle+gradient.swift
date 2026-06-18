//
//  ShapeStyle+gradient.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

extension ShapeStyle where Self == LinearGradient {

    static var color1: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(hex: 0xFE9448),
				Color(hex: 0xB57BFF),
                Color(hex: 0x6981FF)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }

}

//
//  View+frame.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

extension View {

    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }

}

//
//  GalleryView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        GlobalConstants.bgColor
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

#Preview {
    GalleryView()
}

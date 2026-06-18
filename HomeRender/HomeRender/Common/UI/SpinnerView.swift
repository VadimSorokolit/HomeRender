//
//  SpinnerView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct SpinnerView: View {
    var size: ControlSize = .large

    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.gray)
            .controlSize(size)
            .background(Color.clear)
    }
}

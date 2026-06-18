//
//  HomeRenderApp.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

@main
struct HomeRenderApp: App {
    @State private var viewModel = ToolsViewModel()

    var body: some Scene {
        WindowGroup {
            RootTabsView()
                .overlay {
                    if viewModel.isLoading {
                        SpinnerView()
                    }
                }
                .environment(viewModel)
        }
    }

}

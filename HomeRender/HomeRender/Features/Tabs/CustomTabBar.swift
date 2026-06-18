//
//  GenreCell.swift
//  TuneBox
//
//  Created by Vadim Sorokolit on 05.06.2026.
//

import SwiftUI

enum HomeTab: Hashable, Identifiable, CaseIterable {
    case tools
    case gallery
    case discover
    
    var id: Self { self }
    
    static let tabs: [HomeTab] = [
        .tools,
        .gallery,
        .discover
    ]
    
    var title: String {
        switch self {
            case .tools:
                "Tools"
            case .gallery:
                "Gallery"
            case .discover:
                "Discover"
        }
    }
    
    var icon: String {
        switch self {
            case .tools:
                "tools"
            case .gallery:
                "gallery"
            case .discover:
                "discover"
        }
    }
}

struct RootTabsView: View {
    @State private var activeTab: HomeTab = .tools
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            
            tabBar
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottom
        )
    }
    
    @ViewBuilder
    private var content: some View {
        Group {
            switch activeTab {
                case .tools:
                    ToolsView()
                    
                case .gallery:
                    GalleryView()
                    
                case .discover:
                    DiscoverView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var tabBar: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                colors: [
                    Color.white.opacity(0),
                    Color.white.opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 96)
            
            HStack(spacing: 0) {
                ForEach(HomeTab.tabs) { tab in
                    TabItemView(
                        tab: tab,
                        isSelected: activeTab == tab,
                        activeColor: .black,
                        inactiveColor: Color(hex: 0xB8B8BA)
                    ) {
                        activeTab = tab
                    }
                }
            }
            .padding(.horizontal, 36)
            .frame(height: 62)
            .background(tabBarBackground)
            .padding(.horizontal, 16)
        }
    }
    
    private var tabBarBackground: some View {
        RoundedRectangle(cornerRadius: 96)
            .fill(Color(hex: 0xFCFCFC))
            .overlay {
                RoundedRectangle(cornerRadius: 31)
                    .stroke(.white, lineWidth: 1)
            }
            .shadow(
                color: .black.opacity(0.04),
                radius: 8,
                x: 2,
                y: 2
            )
    }
}

private struct TabItemView: View {
    let tab: HomeTab
    let isSelected: Bool
    let activeColor: Color
    let inactiveColor: Color
    let onTap: () -> Void
    
    private let iconSize: CGFloat = 24
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.28, dampingFraction: 0.78)) {
                onTap()
            }
        } label: {
            VStack(spacing: 3) {
                Image(tab.icon)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize, height: iconSize)
                    .foregroundStyle(isSelected ? activeColor : inactiveColor)
                
                Text(tab.title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(isSelected ? activeColor : inactiveColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
        }
        .buttonStyle(.plain)
    }
}

#Preview("Tab Bar Only") {
    ZStack(alignment: .bottom) {
        Color(hex: 0xF3F2F1)
            .ignoresSafeArea()
        
        HStack {
            ForEach(HomeTab.tabs) { tab in
                TabItemView(
                    tab: tab,
                    isSelected: tab == .tools,
                    activeColor: .black,
                    inactiveColor: Color(hex: 0xADACB1)
                ) {}
            }
        }
        .frame(height: 62)
        .background {
            RoundedRectangle(cornerRadius: 31)
                .fill(Color(hex: 0xF9F9F9).opacity(0.9))
                .overlay {
                    RoundedRectangle(cornerRadius: 31)
                        .stroke(.white, lineWidth: 1)
                }
                .shadow(
                    color: .black.opacity(0.04),
                    radius: 8,
                    x: 2,
                    y: 2
                )
        }
        .padding(.horizontal, 16)
    }
}

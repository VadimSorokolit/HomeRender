//
//  ToolsView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

enum AppRoute: Hashable {
    case sketchToRender(ToolCard)
}

import SwiftUI

struct ToolsView: View {
    @Environment(ToolsViewModel.self) private var viewModel
    @State private var path: [AppRoute] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                GlobalConstants.bgColor
                    .ignoresSafeArea()
                
            }
            .safeAreaInset(edge: .top) {
                VStack(spacing: 0) {
                    HeaderView()
                    
                    ContentView { route in
                        path.append(route)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationDestination(for: AppRoute.self) { route in
            switch route {
                case .sketchToRender(let card):
                    SketchToRenderView(card: card)
            }
        }
        .task {
            guard viewModel.cards.isEmpty else {
                return
            }
            
            viewModel.loadCards()
        }
    }
    
    private struct HeaderView: View {
        let cornerRadius: CGFloat = 96
        let width: CGFloat = 94
        let height: CGFloat = 32
        let text: String = "GET PRO"
        let textColor = Color(hex: 0xFFFFFF)
        
        var body: some View {
            HStack {
                Button(action: {
                    print("GetProButton did tap")
                }, label: {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundStyle(.getProButtonColor)
                        .frame(width: width, height: height)
                        .overlay {
                            Text(text)
                                .foregroundStyle(textColor)
                                .font(.system(size: 14, weight: .bold))
                        }
                        
                })
                
                Spacer()
                
                Button(action: {
                    print("UserButton did tap")
                }, label: {
                    Rectangle()
                        .fill(.clear)
                        .frame(size: 44)
                        .overlay {
                            Image(.user)
                                .resizable()
                                .scaledToFit()
                                .frame(size: 24)
                                .foregroundStyle(Color(hex: 0x8C8C8F))
                        }
                })
                
            }
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(GlobalConstants.bgColor)
        }
    }
    
    private struct ContentView: View {
        @Environment(ToolsViewModel.self) private var viewModel
        
        let onNavigate: (AppRoute) -> Void
        
        var body: some View {
            if viewModel.cards.isEmpty, viewModel.isLoading == false {
                ContentUnavailableView(
                    "No Interiors",
                    systemImage: "house"
                )
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.cards) { card in
                            ToolCell(
                                card: card,
                                onRightImageTap: {
                                    onNavigate(.sketchToRender(card))
                                },
                                onButtonTap: {
                                    onNavigate(.sketchToRender(card))
                                }
                            )
                        }
                    }
                }
                .contentMargins(.bottom, 96)
            }
        }
    }
}

#Preview {
    ToolsView()
        .environment(ToolsViewModel())
}

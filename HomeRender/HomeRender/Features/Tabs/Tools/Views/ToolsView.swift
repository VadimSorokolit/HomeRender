//
//  ToolsView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

enum AppRoute: Hashable {
    case sketchToRender(ToolCard)
}

struct ToolsView: View {
    @Environment(ToolsViewModel.self) private var viewModel
    @State private var selectedCard: ToolCard?

    var body: some View {
        ZStack {
            GlobalConstants.bgColor
                .ignoresSafeArea()
        }
        .safeAreaInset(edge: .top) {
            VStack(spacing: 0) {
                HeaderView()

                ContentView { card in
                    selectedCard = card
                }
            }
            .padding(.horizontal)
        }
        .fullScreenCover(item: $selectedCard) { card in
            SketchToRenderView(card: card)
        }
        .task {
            guard viewModel.cards.isEmpty else { return }
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
                        .offset(x: 5)
                })
                
            }
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(GlobalConstants.bgColor)
        }
    }
    
    private struct ContentView: View {
        @Environment(ToolsViewModel.self) private var viewModel
        
        let onNavigate: (ToolCard) -> Void
        
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
                                onCellTap: {
                                    onNavigate(card)
                                },
                                onButtonTap: {
                                    onNavigate(card)
                                }
                            )
                        }
                    }
                }
                .padding(.top, 12)
                .contentMargins(.bottom, 96)
            }
        }
    }
}

#Preview {
    ToolsView()
        .environment(ToolsViewModel())
}

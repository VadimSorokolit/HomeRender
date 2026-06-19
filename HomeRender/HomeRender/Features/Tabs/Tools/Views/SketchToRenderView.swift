//
//  SketchToRenderView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct SketchToRenderView: View {
    @Environment(\.dismiss) private var dismiss
    let card: ToolCard?
    
    var body: some View {
        ZStack {
            GlobalConstants.bgColor
                .ignoresSafeArea()
            
        }
        .safeAreaInset(edge: .top) {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .fill(GlobalConstants.bgColor)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .frame(width: 44, height: 44, alignment: .leading)
                    })
                    .padding(.leading, 30)
                }
                .frame(height: 48)
                
                ContentView(card: card)
            }
        }
        .safeAreaInset(edge: .bottom) {
            BottomView()
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    private struct ContentView: View {
        let card: ToolCard?
        
        var body: some View {
            ScrollView(showsIndicators: false) {
                CarouselView(card: card)
            }
            .padding(.horizontal)
        }
        
        private struct CarouselView: View {
            let card: ToolCard?
            
            let imageHeight: CGFloat = 436
            @State private var sliderPosition: CGFloat = 0.5
            @GestureState private var dragTranslation: CGFloat = 0
            
            var body: some View {
                VStack(spacing: 0) {
                    if let card {
                        GeometryReader { proxy in
                            let width = proxy.size.width
                            let dividerX = width * min(max(sliderPosition + dragTranslation / width, 0), 1)
                            
                            ZStack(alignment: .topLeading) {
                                Image(card.afterImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width, height: imageHeight)
                                    .clipped()
                                
                                Image(card.beforeImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width, height: imageHeight)
                                    .clipped()
                                    .mask(alignment: .leading) {
                                        Rectangle().frame(width: dividerX)
                                    }
                                
                                HStack {
                                    comparisonBadge("Before")
                                    
                                    Spacer()
                                    
                                    comparisonBadge("After")
                                }
                                .padding(.top, 16)
                                .padding(.horizontal, 16)
                                
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 4, height: imageHeight)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .offset(x: dividerX - 2)
                                
                                Circle()
                                    .fill(.white)
                                    .frame(size: 44)
                                    .shadow(
                                        color: .black.opacity(0.25),
                                        radius: 4,
                                        x: 0,
                                        y: 4
                                    )
                                    .overlay {
                                        HStack(spacing: 0) {
                                            Image(systemName: "chevron.left")
                                                .font(.system(size: 20, weight: .regular))
                                                .foregroundStyle(.black)
                                            
                                            Image(systemName: "chevron.right")
                                                .font(.system(size: 20, weight: .regular))
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .offset(x: dividerX - 22)
                                    .contentShape(Circle())
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .updating($dragTranslation) { value, state, _ in
                                                state = value.translation.width
                                            }
                                            .onEnded { value in
                                                sliderPosition = min(
                                                    max(sliderPosition + value.translation.width / width, 0),
                                                    1
                                                )
                                            }
                                    )
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                        }
                        .frame(height: imageHeight)
                        .contentMargins(.bottom, 98)
                    }
                }
            }
            
            private func comparisonBadge(_ title: String) -> some View {
                RoundedRectangle(cornerRadius: 96)
                    .fill(.white.opacity(0.8))
                    .frame(width: 56, height: 26)
                    .background(.ultraThinMaterial)
                    .overlay {
                        Text(title)
                            .foregroundStyle(.black)
                            .font(.system(size: 14, weight: .semibold))
                    }
            }
        }
    }
    
    private struct BottomView: View {

        var body: some View {
            HStack {
                VStack(spacing: 16) {
                    HStack {
                        Button(action: {
                            print("Resize button did tap")
                        }, label: {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(hex: 0xCECED0), lineWidth: 1)
                                }
                                .overlay {
                                    HStack(spacing: 6) {
                                        Image(.resize)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.black)
                                            .frame(size: 20)
                                        
                                        Text("Resize")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            print("Save button did tap")
                        }, label: {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(hex: 0xCECED0), lineWidth: 1)
                                }
                                .overlay {
                                    HStack(spacing: 6) {
                                        Image(.save)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.black)
                                            .frame(size: 20)
                                        
                                        Text("Save")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                }
                        })
                    }
                    
                    Button(action: {
                        print("Regenerate button did tap")
                    }, label: {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .overlay {
                                HStack(spacing: 8) {
                                    Image(.arrow)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                        .frame(size: 24)
                                    
                                    Text("Regenerate")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16, weight: .medium))
                                }
                            }
                    })
                }
                .padding()
            }
        }
    }
    
}

#Preview {
    SketchToRenderView(card: nil)
}

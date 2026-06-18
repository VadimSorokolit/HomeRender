//
//  SketchToRenderView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct SketchToRenderView: View {
    let card: ToolCard?
    
    var body: some View {
        ZStack {
            GlobalConstants.bgColor
                .ignoresSafeArea()
            
        }
        .safeAreaInset(edge: .top) {
            ContentView()
        }
        .safeAreaInset(edge: .bottom) {
            BottomView()
        }
    }
    
    private struct ContentView: View {
        
        var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(GlobalConstants.bgColor)
                        .frame(height: 48)
                    
                    CarouselView()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 582)
            }
            .padding(.horizontal)
        }
        
        private struct CarouselView: View {
            
            var body: some View {
                VStack(spacing: 0) {
                    HStack {
                        
                    }
                    .frame(height: 436)
                    
                    Rectangle()
                        .fill(GlobalConstants.bgColor)
                        .frame(height: 98)
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
                                        .font(.system(size: 24, weight: .medium))
                                }
                            }
                    })
                }
                .padding()
            }
            .frame(height: 152)
        }
    }
    
}

#Preview {
    SketchToRenderView(card: nil)
}

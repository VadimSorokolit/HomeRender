//
//  ToolsView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct ToolsView: View {
    
    private enum Constants {
        static let bgColor = Color(hex: 0xF3F2F1)
    }
    
    var body: some View {
        ZStack {
            Constants.bgColor
                .ignoresSafeArea()
                
        }
        .safeAreaInset(edge: .top) {
            VStack(spacing: 0) {
                HeaderView()
                
                ContentView()
            }
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
            .padding(.horizontal)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(Constants.bgColor)
        }
    }
    
    private struct ContentView: View {
        
        var body: some View {
            Text("Hello")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Constants.bgColor)
        }
    }
}

#Preview {
    ToolsView()
}

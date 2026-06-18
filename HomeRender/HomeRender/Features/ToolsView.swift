//
//  ToolsView.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct ToolsView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: 0xf3f2f1)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(spacing: 0) {
                HeaderView()
                
                ContentView()
            }
            .padding(.horizontal)
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
                    
                }, label: {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundStyle(.color1)
                        .frame(width: width, height: height)
                        .overlay {
                            Text(text)
                                .foregroundStyle(textColor)
                                .font(.system(size: 14, weight: .bold))
                        }
                        
                })
                
                Spacer()
                
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 24))
                    .foregroundStyle(Color(hex: 0x8C8C8F))
                
            }
            .padding(.vertical, 6)
        }
    }
    
    private struct ContentView: View {
        
        var body: some View {
            Text("Hello")
        }
    }
}

#Preview {
    ToolsView()
}

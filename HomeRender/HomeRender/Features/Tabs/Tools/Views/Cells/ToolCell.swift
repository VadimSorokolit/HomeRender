//
//  ToolCell.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import SwiftUI

struct ToolCell: View {
    let card: ToolCard
    let onRightImageTap: () -> Void
    let onButtonTap: () -> Void
    
    let imageHeight: CGFloat = 129

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    Image(card.beforeImage)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: proxy.size.width / 2 - 1,
                            height: imageHeight
                        )
                        .clipped()

                    Rectangle()
                        .fill(.white)
                        .frame(width: 2)

                    Button {
                        onRightImageTap()
                    } label: {
                        Image(card.afterImage)
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: proxy.size.width / 2 - 1,
                                height: imageHeight
                            )
                            .clipped()
                    }
                    .buttonStyle(.plain)
                }

            }

            .frame(height: imageHeight)

            .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(card.title)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text(card.subtitle)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: 0x8C8C8F))
                }
                .frame(width: 230, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    onButtonTap()
                }, label: {
                    RoundedRectangle(cornerRadius: 60)
                        .fill(.black)
                        .frame(width: 49, height: 32)
                        .shadow(
                            color: .black.opacity(0.04),
                            radius: 16,
                            x: 5,
                            y: 4
                        )
                        .overlay {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                })
            }
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: 0xF3F2F1), lineWidth: 1)
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        
        ToolCell(
            card: ToolCard(
                id: 1,
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                beforeImage: "before1",
                afterImage: "after1"
            ),
            onRightImageTap: {
                print("After image tapped")
            },
            onButtonTap: {
                print("Button tapped")
            }
        )
        .padding()
    }
}

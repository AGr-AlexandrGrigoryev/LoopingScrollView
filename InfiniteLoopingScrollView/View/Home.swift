//
//  Home.swift
//  InfiniteLoopingScrollView
//
//  Created by Alexandr Grigorjev on 28.11.2023.
//

import SwiftUI

struct Home: View {
    // MARK: - Properties

    @State private var imageItem = ImageItem.imageItems
    @State private var macImageItem = ImageItem.macImageItems

    // MARK: - UI

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                makeText("Infinite Looping ScrollView with paging")
                scrollViewWithPaging
            }

            VStack(alignment: .leading, spacing: 0) {
                makeText("Infinite Looping ScrollView without paging")
                scrollViewWithoutPaging
                    .padding(.top)
            }
        }
        .navigationTitle("Infinite Scroll View")
//      .scrollIndicators(.hidden)
    }

    // MARK: - Private helpers

    private var scrollViewWithPaging: some View {
        GeometryReader {
            let size = $0.size

            LoopingScrollView(
                width: size.width,
                spacing: 0,
                items: imageItem
            ) { item in
                item.image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .padding(.horizontal, 8)
            }
            .shadow(radius: 6.0, x: 3, y: 3 )
            .scrollTargetBehavior(.paging)
//          .scrollTargetBehavior(.viewAligned)
//          .contentMargins(.horizontal, 15, for: .scrollContent)
        }
        .frame(height: 240)
    }

    private var scrollViewWithoutPaging: some View {
            GeometryReader {
                let size = $0.size

                LoopingScrollView(
                    width: 300,
                    spacing: 0,
                    items: macImageItem
                ) { item in
                    item.image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .padding(.horizontal, 8)

                }
                .shadow(radius: 6.0, x: 3, y: 3)
            }
            .frame(height: 180)
    }

    private func makeText(_ text: String) -> some View {
        Text(text)
            .font(.subheadline).fontWeight(.regular)
            .padding(.horizontal)
            .padding(.top)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

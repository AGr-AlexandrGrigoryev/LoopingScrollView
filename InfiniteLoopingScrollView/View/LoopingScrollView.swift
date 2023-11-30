//
//  LoopingScrollView.swift
//  InfiniteLoopingScrollView
//
//  Created by Alexandr Grigorjev on 28.11.2023.
//

import SwiftUI

struct LoopingScrollView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
    // MARK: - Properties

    var width: CGFloat
    var spacing: CGFloat = 0
    let items: Item
    @ViewBuilder var content: (Item.Element) -> Content

    // MARK: - UI

    var body: some View {
        GeometryReader {
            let size = $0.size
            let repeatingCount = width > 0 ? Int((size.width / width).rounded()) + 1 : 1 // + 1 safety buffer

            ScrollView(.horizontal) {
                LazyHStack(spacing: spacing) {
                    ForEach(items, id: \.id) { item in
                        content(item)
                            .frame(width: width)
                    }
                    /// Here is the magic happens
                    /// We are adding the same items again so it looks like it is infinite but it is not
                    /// it is just a repeating of the same items again and again
                    ForEach(0..<repeatingCount, id: \.self) { index in
                        let item = Array(items)[index % items.count]
                        content(item)
                            .frame(width: width)
                    }
                }
                .background {
                    ScrollViewHelper(
                        width: width,
                        spacing: spacing,
                        itemCount: items.count,
                        repeatingCount: repeatingCount
                    )
                }
            }
        }
        .scrollIndicators(.automatic)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

// MARK: - ScrollViewHelper

/// We need to add this helper view to the background of the LazyHStack
fileprivate struct ScrollViewHelper: UIViewRepresentable {
    var width: CGFloat
    var spacing: CGFloat
    var itemCount: Int
    var repeatingCount: Int

    /// We need to create a coordinator to be able to get the scrollViewDidScroll callback
    func makeCoordinator() -> Coordinator {
        return Coordinator(
            width: width,
            spacing: spacing,
            itemCount: itemCount,
            repeatingCount: repeatingCount
        )
    }

    /// We need to return an empty view here
    func makeUIView(context: Context) -> UIView {
        return .init()
    }

    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if let
                scrollView = uiView.superview?.superview?.superview as? UIScrollView,
               !context.coordinator.isAdded
            {
                scrollView.delegate = context.coordinator
                context.coordinator.isAdded = true
            }
        }

        /// We need to update the coordinator with the new values
        context.coordinator.width = width
        context.coordinator.spacing = spacing
        context.coordinator.itemCount = itemCount
        context.coordinator.repeatingCount = repeatingCount
    }
}

class Coordinator: NSObject, UIScrollViewDelegate {
    var width: CGFloat
    var spacing: CGFloat
    var itemCount: Int
    var repeatingCount: Int

    init(
        width: CGFloat,
        spacing: CGFloat,
        itemCount: Int,
        repeatingCount: Int
    ) {
        self.width = width
        self.spacing = spacing
        self.itemCount = itemCount
        self.repeatingCount = repeatingCount
    }

    ///  Tell us when  whether we need to scroll to the beginning or to the end
    var isAdded: Bool = false

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        ///

        guard itemCount > 0 else { return }
        
        let minX = scrollView.contentOffset.x
        let mainContentSize = CGFloat(itemCount) * width
        let spacingSize = CGFloat(itemCount) * spacing
        print(mainContentSize + spacingSize)

        /// If we scrolled to the end of the main content size + spacing size then scroll to the beginning of the main content size
        if minX > (mainContentSize + spacingSize) {
            scrollView.contentOffset.x -= (mainContentSize + spacingSize)
        }

        /// If we scrolled to the beginning of the main content size + spacing size then scroll to the end of the main content size
        if minX < 0 {
            scrollView.contentOffset.x += (mainContentSize + spacingSize)
        }
    }
}


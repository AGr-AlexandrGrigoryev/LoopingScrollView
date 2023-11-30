//
//  Item.swift
//  InfiniteLoopingScrollView
//
//  Created by Alexandr Grigorjev on 28.11.2023.
//

import SwiftUI

/// Simple model for the item
struct Item: Identifiable {
    var id: UUID = .init()
    var color: Color
}

struct ImageItem: Identifiable {
    var id: UUID = .init()
    var image: Image

    static var imageItems: [ImageItem] = [
        ImageItem(image: .init("Apple TV _ Home")),
        ImageItem(image: .init("iMac 24")),
        ImageItem(image: .init("iMac 27")),
        ImageItem(image: .init("iOS _ iPadOS")),
        ImageItem(image: .init("iOS _ WatchOS")),
        ImageItem(image: .init("iOS"))
    ]

    static var macImageItems: [ImageItem] = [
        ImageItem(image: .init("Mac Mini")),
        ImageItem(image: .init("Mac Pro")),
        ImageItem(image: .init("Mac Studio")),
        ImageItem(image: .init("MacBook Air")),
        ImageItem(image: .init("MacBook Pro 4th Gen")),
        ImageItem(image: .init("MacBook Pro 5th Gen"))
    ]
}

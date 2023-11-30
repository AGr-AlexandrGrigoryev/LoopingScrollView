# Infinite Looping ScrollView in SwiftUI
![iPhone 14 Pro Max - Clay Dark](https://github.com/AGr-AlexandrGrigoryev/LoopingScrollView/assets/37674802/21083112-d1f9-454a-909e-3a65df7c8a14)
## Overview

This SwiftUI project provides an implementation of an infinite looping ScrollView for iOS 17. The `LoopingScrollView` allows users to create a horizontally scrolling view with a repeating pattern, giving the illusion of infinite content.

## Features

- Infinite scrolling for horizontally displayed content
- Customizable width, spacing, and content
- Utilizes SwiftUI for a clean and declarative syntax
- Compatible with iOS 17

## Example Usage

To use the `LoopingScrollView` in your SwiftUI project, follow these steps:

1. Instantiate the `LoopingScrollView` in your SwiftUI view and provide the necessary parameters, such as width, spacing, and content.

## Parameters

- **width**: The width of each item in the scrolling view.
- **spacing**: The spacing between each item.
- **items**: A collection of identifiable items to display in the ScrollView.
- **content**: A closure defining the content of each item based on the provided collection.

## How It Works

The `LoopingScrollView` achieves infinite scrolling by adding the same set of items multiple times within the ScrollView. It intelligently adjusts the content offset during scrolling to give the appearance of a seamless loop.

![Simulator Screen Recording - iPhone 15 - 2023-11-30 at 15 30 53](https://github.com/AGr-AlexandrGrigoryev/LoopingScrollView/assets/37674802/850b5de1-71b2-482d-acf6-3e1e1d51159d)

## License

This project is open-source and distributed under the MIT License. Feel free to modify and use it in your projects.

## Author

- Alexandr Grigorjev

## Additional Notes

Please note that this implementation may require adjustments based on your specific use case and styling preferences. Feel free to experiment and customize the code to suit your application's needs.

Happy coding! 🚀

# ResizableView

ResizableView is a SwiftUI component that allows you to create a dynamically resizable view using drag gestures. This component is particularly useful when you need to provide users with the ability to adjust the width of a view by dragging a handle.

![](https://github.com/alpaycli/ResizableView/blob/main/PreviewGIF.gif)

## Features

- Supports dynamic resizing via drag gestures.
- Customizable minimum and maximum width.
- Adjustable control handle for resizing.
- Works with any SwiftUI content.
- Supports alignment of the control handle on either the left or right edge.

## Installation

#### Requirements

- iOS 15.0+

#### Via Swift Package Manager

- Go to File > Add Package Dependencies...
- Enter https://github.com/alpaycli/ResizableView.git
- Select the version and add the package to your project.

## Usage

### Basic Usage
```Swift
import SwiftUI

struct ContentView: View {
    @State private var width: CGFloat = 200
    
    var body: some View {
        ResizableView(
            width: $width,
            maxWidth: 400,
            controlEdge: .right
        ) {
            Text("Resizable Content")
                .padding()
        }
        .frame(height: 200)
        .padding()
    }
}
```

## Customization
width: A binding to the width of the resizable view.
maxWidth: The maximum width that the view can be resized to.
controlEdge: The edge where the control handle is located (.left or .right).
content: The content to be displayed inside the resizable view.

## License

ResizableView is available under the MIT license. See the LICENSE file for more info.

## Contributions

Contributions are welcome! If you have any suggestions or improvements, please create an issue or submit a pull request.

## Acknowledgements

This package is inspired by the need for flexible and user-friendly resizable views in SwiftUI applications.

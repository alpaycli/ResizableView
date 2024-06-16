ResizableView

ResizableView is a SwiftUI component that allows you to create a dynamically resizable view using drag gestures. This component is particularly useful when you need to provide users with the ability to adjust the width of a view by dragging a handle.

Features

Supports dynamic resizing via drag gestures.
Customizable minimum and maximum width.
Adjustable control handle for resizing.
Works with any SwiftUI content.
Supports alignment of the control handle on either the left or right edge.
Requirements

iOS 15.0+
Swift 5.5+
Installation

Swift Package Manager
To add ResizableView to your project, you can use Swift Package Manager. In Xcode:

Go to File > Add Packages...
Enter the repository URL for this package.
Select the version and add the package to your project.
Usage

Basic Usage
swift
Copy code
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
Customization
width: A binding to the width of the resizable view.
maxWidth: The maximum width that the view can be resized to.
controlEdge: The edge where the control handle is located (.left or .right).
content: The content to be displayed inside the resizable view.
Example
swift
Copy code
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
API

ResizableView
swift
Copy code
@available(iOS 15.0, *)
public struct ResizableView<Content: View>: View {
    
    public init(
        width: Binding<CGFloat>,
        maxWidth: CGFloat,
        controlEdge: Edge,
        @ViewBuilder content: () -> Content
    )
    
    public var body: some View
}
Edge Enum
swift
Copy code
extension ResizableView {
    public enum Edge {
        case left, right
        
        var alignment: Alignment {
            switch self {
            case .left: return .trailing
            case .right: return .leading
            }
        }
    }
}
License

ResizableView is available under the MIT license. See the LICENSE file for more info.

Contributions

Contributions are welcome! If you have any suggestions or improvements, please create an issue or submit a pull request.

Acknowledgements

This package is inspired by the need for flexible and user-friendly resizable views in SwiftUI applications.

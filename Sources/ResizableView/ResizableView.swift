import SwiftUI

/// View that can be dynamically resize with Drag Gestures.
@available(iOS 15.0, *)
public struct ResizableView<Content: View>: View {
    
    @Binding private var resizingWidth: CGFloat
    
    @State private var minWidth: CGFloat?
    private let maxWidth: CGFloat
    private let controlEdge: Edge
    private var contentAlignment: Alignment
    private let content: Content
    
    @State private var controlStickOpacity = 1.0
    @State private var controlStickScale = 1.0
    
    public init(
        width: Binding<CGFloat>,
        maxWidth: CGFloat,
        controlEdge: Edge,
        contentAlignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) {
        self._resizingWidth = width
        self.maxWidth = maxWidth
        self.controlEdge = controlEdge
        self.contentAlignment = contentAlignment
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: controlEdge.alignment) {
            ContentContainerView
                .onAppear {
                    if minWidth == nil {
                        minWidth = resizingWidth
                    }
                }
            
            if controlEdge == .left {
                HStack {
                    HandleStickView
                    Spacer()
                }
            } else {
                HStack {
                    Spacer()
                    HandleStickView
                }
            }
        }
    }
    
    private var ContentContainerView: some View {
        Rectangle()
            .fill(.clear)
            .overlay(alignment: contentAlignment) { content }
            .cornerRadius(10)
            .frame(minWidth: minWidth ?? resizingWidth)
            .frame(maxWidth: maxWidth)
            .frame(width: resizingWidth)
            .frame(minHeight: 100, maxHeight: .infinity, alignment: controlEdge.alignment)
    }
    
    private var HandleStickView: some View {
        Rectangle()
            .fill(Color.gray)
            .opacity(controlStickOpacity)
            .frame(width: 8, height: 100)
            .cornerRadius(10)
            .gesture(dragGesture)
            .scaleEffect(controlStickScale)
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.easeIn(duration: 0.1)) {
                    controlStickOpacity = 0.1
                    controlStickScale = 2.0
                }
                let translation = value.translation.width
                let change = controlEdge == .left ? -translation : translation
                let newWidth = resizingWidth + change
                
                if newWidth >= (minWidth ?? resizingWidth) && newWidth <= maxWidth {
                    resizingWidth = newWidth
                }
            }
            .onEnded { _ in
                withAnimation(.easeIn(duration: 0.1)) { 
                    controlStickOpacity = 1.0
                    controlStickScale = 1.0
                }
            }
    }
}

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

@available(iOS 18.0, *)
#Preview {
    @Previewable @State var width: CGFloat = 150
    
    ResizableView(
        width: $width,
        maxWidth: 300,
        controlEdge: .right,
        contentAlignment: .center
    ) {
        Text("Resizable Content")
            .padding()
            .background(.gray)
    }
    .frame(width: width, height: 200)
    .frame(maxWidth: .infinity, alignment: .leading)
}

//
//  ContentView.swift
//  shapes
//
//  Created by aaron on 9/29/24.
//
import SplineRuntime
import SwiftUI

struct ContentView: View {
    @State private var isShowingImmersive: Bool = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            HStack {
                Toggle("Show Immersive Space", isOn: $isShowingImmersive)
                    .toggleStyle(.button)
                    .onChange(of: isShowingImmersive) { _, isShowing in
                        Task {
                            if isShowing {
                                await openImmersiveSpace(id: "immersive")
                            } else {
                                await dismissImmersiveSpace()
                            }
                            
                        }
                    }
            }
        }
    }
}

struct ImmersiveView: ImmersiveSpaceContent {
    var body: some ImmersiveSpaceContent {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/pNMn9O4ZuJmcxSj5osSw/scene.splineswift")!
        SplineImmersiveSpaceContent(sceneFileURL: url)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

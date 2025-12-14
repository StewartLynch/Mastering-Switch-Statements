//
//----------------------------------------------
// Original project: Mastering Switch
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.

import Playgrounds
import SwiftUI

struct SecondView: View {
    @State private var tappedPoint: CGPoint?
    @State private var tappedCoordinates: (x: CGFloat, y: CGFloat)?
    
    var body: some View {
        VStack {
            ViewOption.second.descrView
            CartesianCoordinateView(tappedCoordinates: $tappedCoordinates)
            if let tappedCoordinates {
                VStack {
                    Text("(\(Text(tappedCoordinates.x, format: .number)),\(Text(tappedCoordinates.y, format: .number)))")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        SecondView()
            .navigationTitle(ViewOption.second.title)
    }
}

#Playground("Bindings and Tuples") {
    
}

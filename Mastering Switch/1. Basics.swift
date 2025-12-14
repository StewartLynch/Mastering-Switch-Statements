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

struct FirstView: View {
    @State private var score: Int?
    var body: some View {
        Form {
            TextField(
                "Enter Score",
                value: $score,
                format: .number.precision(.fractionLength(0))
            )
            .keyboardType(.numberPad)
            ViewOption.first.descrView
        }
    }
}

#Preview {
    NavigationStack {
        FirstView()
            .navigationTitle(ViewOption.first.title)
    }
}

#Playground("Basic with OR") {
    
}

#Playground("Basic with Range") {
    
}

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

enum AppTheme: String, CaseIterable {
    case system, light, dark
}

struct ThirdView: View {
    @State var appTheme = AppTheme.system
    var body: some View {
        VStack {
            ViewOption.third.descrView
            Picker("Theme", selection: $appTheme) {
                ForEach(AppTheme.allCases, id: \.self) { theme in
                    Text(theme.rawValue.capitalized)
                }
            }
            .padding()
            .pickerStyle(.segmented)
            Image(systemName: "sunset.fill")
                .font(.system(size: 100))
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ThirdView()
            .navigationTitle(ViewOption.third.title)
    }
}



#Playground("Enum Switch") {
    
}

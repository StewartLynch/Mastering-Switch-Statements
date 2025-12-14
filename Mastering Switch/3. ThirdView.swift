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
    var preferredColorScheme: ColorScheme? {
        switch self {
        case .system:
            nil
        case .light:
                .light
        case .dark:
                .dark
        }
    }
    
    var symbolName: String {
        switch self {
        case .system:
            "sunset.fill"
        case .light:
            "sun.max.circle.fill"
        case .dark:
            "moon"
        @unknown default:
            "questionmark.circle"
        }
    }
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
            Image(systemName: appTheme.symbolName)
                .font(.system(size: 100))
            Spacer()
        }
        .preferredColorScheme(appTheme.preferredColorScheme)
    }
}

#Preview {
    NavigationStack {
        ThirdView()
            .navigationTitle(ViewOption.third.title)
    }
}



#Playground("Enum Switch") {
    let theme = AppTheme.system
    switch theme {
    case .system:
        print("Use system setting")
    case .light:
        print("Set to light")
    case .dark:
        print("Set to dark")
    }
}

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

import SwiftUI

enum ViewOption: CaseIterable, Identifiable, View {
    case first, second, third, fourth
    var id: Self { self }
    
    var title: String {
        switch self {
        case .first:
            "Grade Evaluation"
        case .second:
            "Cartesian Plane"
        case .third:
            "Color Scheme"
        case .fourth:
            "Uber Driver"
        }
    }
    
    var picker: String {
        switch self {
        case .first:
            "The Basics"
        case .second:
            "Value Binding"
        case .third:
            "Enum Switching"
        case .fourth:
            "Associated Values"
        }
    }
    
    var body: some View {
        switch self {
        case .first:
            FirstView()
        case .second:
            SecondView()
        case .third:
            ThirdView()
        case .fourth:
            FourthView()
            
        }
    }
    
    var desc: String {
        switch self {
        case .first:
            """
            Basic switch statements:
            optionals, ranges and combining values.
            """
        case .second:
            """
            Pattern matching with bindings and tuples.
            """
        case .third:
            """
            Switching on enum cases and unknown default.
            """
        case .fourth:
            """
            Switching on enums where some cases have associated values.
            """
        }
        
    }
    var descrView: some View {
        Text(.init(desc))
            .font(.title)
            .padding()
            .background(.gray.opacity(0.5), in: .rect(cornerRadius: 10))
            .padding()
        
    }
}

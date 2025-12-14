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
    var position: String {
        guard let tappedCoordinates else { return ""}
       return  switch tappedCoordinates {
        case (0,0):
            "Origin"
        case (0, let y):
            "On the y axis at \(y)"
        case (_, 0):
            "On the x axis"
        case(let x, let y) where x>0 && y > 0:
            "Quadrant I"
        case(let x, let y) where x<0 && y > 0:
            "Quadrant II"
        case(let x, let y) where x<0 && y < 0:
            "Quadrant III"
        case(let x, let y) where x>0 && y < 0:
            "Quadrant IV"
        default:
            "Somewhere in the plane"
        }
    }
    var body: some View {
        VStack {
            ViewOption.second.descrView
            CartesianCoordinateView(tappedCoordinates: $tappedCoordinates)
            if let tappedCoordinates {
                VStack {
                    Text("(\(Text(tappedCoordinates.x, format: .number)),\(Text(tappedCoordinates.y, format: .number)))")
                    Text(position)
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
    let coordinates = (x: 0, y: 1)
    let result: String = switch coordinates {
    case (0,0):
        "Origin"
    case (0, let y):
        "On the y axis at \(y)"
    case (_, 0):
        "On the x axis"
    case(let x, let y) where x>0 && y > 0:
        "Quadrant I"
    case(let x, let y) where x<0 && y > 0:
        "Quadrant II"
    case(let x, let y) where x<0 && y < 0:
        "Quadrant III"
    case(let x, let y) where x>0 && y < 0:
        "Quadrant IV"
    default:
        "Somewhere in the plane"
    }
}

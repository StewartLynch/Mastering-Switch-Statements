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
    var letterGrade: String {
//        guard let score else { return "" }
       return  switch score {
       case .none:
           ""
       case .some(90...100):
            "A"
       case .some(80..<90):
            "B"
       case .some(70..<80):
            "C"
       case .some(60..<70):
            "D"
       case .some(0..<60):
            "F"
        default:
            "Invalid score"
        }
    }
    
    var comment: String {
        guard !letterGrade.isEmpty else { return "" }
        return switch letterGrade {
        case "A":
            "Excellent"
        case "B", "C":
            "Satisfactory"
        case "D":
            "Needs Improvment"
        case "F":
            "Failing"
        default:
            "Unknown lettergrade"
        }
    }
    var body: some View {
        Form {
            TextField(
                "Enter Score",
                value: $score,
                format: .number.precision(.fractionLength(0))
            )
            .keyboardType(.numberPad)
            Text(letterGrade.isEmpty ? "" : "\(letterGrade) - \(comment)")
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
    let letterGrade = "C"
    
    let comment = switch letterGrade {
    case "A":
        "Excellent"
    case "B", "C":
        "Satisfactory"
    case "D":
        "Needs Improvment"
    case "F":
        "Failing"
    default:
        "Unknown lettergrade"
    }
}

#Playground("Basic with Range") {
    let score = 40
    
    let letterGrade: String = switch score {
    case 90...100:
        "A"
    case 80..<90:
        "B"
    case 70..<80:
        "C"
    case 60..<70:
        "D"
    case 0..<60:
        "F"
    default:
        "Invalid score"
    }
}

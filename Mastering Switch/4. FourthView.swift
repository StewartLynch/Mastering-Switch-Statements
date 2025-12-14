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

struct FourthView: View {
    @State private var driverStatus: Status = .waiting
    var body: some View {
        VStack {
            ViewOption.fourth.descrView
            switch driverStatus {
            case .waiting:
                Image(systemName: "clock.badge.questionmark")
                    .font(.system(size: 100))
            case .onRoute(let eta):
                Image(systemName: "car.rear.road.lane.distance.1.and.gauge.open.with.lines.needle.67percent.and.arrowtriangle")
                    .font(.system(size: 100))
                Text("Arriving in \(eta) minutes")
            case .destination(let location, let passengers):
                Image(systemName: "car")
                    .font(.system(size: 100))
                Text("Driving to \(location) with \(passengers) passengers.")
            }
            
            Spacer()
        }
        .task {
            let statusArray: [Status] = [
                .waiting,
                .onRoute(eta: 3),
                .destination(location: "airport", passengers: 3)
            ]
            for status in statusArray {
                withAnimation{
                    driverStatus = status
                }
                try? await Task.sleep(for: .seconds(5))
            }
        }
    }
}

enum Status {
    case waiting
    case onRoute(eta: Int)
    case destination(location: String, passengers: Int)
}

#Preview {
    NavigationStack {
        FourthView()
            .navigationTitle(ViewOption.fourth.title)
    }
}

#Playground("Associated Values") {
    let driverStatus: Status = .waiting
    switch driverStatus {
    case .waiting:
        print("Driver is waiting for fare")
    case .onRoute(let eta):
        print("Driver on route.  ETA is \(eta) minutes.")
    case .destination(let location, let passengers):
        print("Driver taking \(passengers) passengers to \(location)")
    }
}


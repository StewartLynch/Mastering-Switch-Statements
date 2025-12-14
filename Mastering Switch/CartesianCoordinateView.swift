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

struct CartesianCoordinateView: View {
    let minValue: CGFloat = -10
    let maxValue: CGFloat = 10
    @Binding var tappedCoordinates: (x: CGFloat, y: CGFloat)?
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
            let scale = size.width / (maxValue - minValue)

            Canvas { context, canvasSize in
                func point(x: CGFloat, y: CGFloat) -> CGPoint {
                    CGPoint(
                        x: center.x + x * scale,
                        y: center.y - y * scale
                    )
                }
                var axes = Path()
                axes.move(to: point(x: minValue, y: 0))
                axes.addLine(to: point(x: maxValue, y: 0))
                axes.move(to: point(x: 0, y: minValue))
                axes.addLine(to: point(x: 0, y: maxValue))
                context.stroke(axes, with: .color(.primary), lineWidth: 2)

                var ticks = Path()
                for value in Int(minValue)...Int(maxValue) {
                    let v = CGFloat(value)

                    ticks.move(to: point(x: v, y: -0.15))
                    ticks.addLine(to: point(x: v, y: 0.15))

                    ticks.move(to: point(x: -0.15, y: v))
                    ticks.addLine(to: point(x: 0.15, y: v))
                }

                context.stroke(ticks, with: .color(.secondary), lineWidth: 1)

                if let tappedCoordinates {
                    let dot = point(x: tappedCoordinates.x, y: tappedCoordinates.y)
                    let circle = Path(ellipseIn: CGRect(x: dot.x - 4, y: dot.y - 4, width: 8, height: 8))
                    context.fill(circle, with: .color(.red))
                }
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onEnded { value in
                        let location = value.location

                        let rawX = (location.x - center.x) / scale
                        let rawY = (center.y - location.y) / scale

                        // Snap to nearest 0.5
                        let snappedX = rawX.snapped(to: 0.5)
                        let snappedY = rawY.snapped(to: 0.5)

                        // Optional: clamp to your axis range
                        let clampedX = min(max(snappedX, minValue), maxValue)
                        let clampedY = min(max(snappedY, minValue), maxValue)

                        tappedCoordinates = (x: clampedX, y: clampedY)
                    }
            )
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    CartesianCoordinateView(tappedCoordinates: .constant(nil))
}

extension CGFloat {
    func rounded(toPlaces places: Int) -> CGFloat {
        let factor = pow(10, CGFloat(places))
        return (self * factor).rounded() / factor
    }
}

extension CGFloat {
    func snapped(to step: CGFloat) -> CGFloat {
        (self / step).rounded() * step
    }
}

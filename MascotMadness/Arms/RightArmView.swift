import SwiftUI

private let sgFlagRed = Color(red: 0.937, green: 0.200, blue: 0.251)
private let armyRed = Color(red: 0.86, green: 0.12, blue: 0.16)
private let armyRedDark = Color(red: 0.66, green: 0.04, blue: 0.09)
private let armorOutline = Color(red: 0.50, green: 0.02, blue: 0.07)
private let skinTone = Color(red: 0.97, green: 0.80, blue: 0.60)
private let skinShadow = Color(red: 0.78, green: 0.57, blue: 0.40)

private struct FivePointedStar: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outer = min(rect.width, rect.height) / 2
        let inner = outer * 0.47

        for index in 0..<10 {
            let angle = (-Double.pi / 2) + Double(index) * .pi / 5
            let radius = index.isMultiple(of: 2) ? outer : inner
            let x = center.x + cos(angle) * radius
            let y = center.y + sin(angle) * radius

            if index == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }

        path.closeSubpath()
        return path
    }
}

private struct SGFlagTattoo: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            ZStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white)

                Rectangle()
                    .fill(sgFlagRed)
                    .frame(height: size.height / 2)
                    .frame(maxHeight: .infinity, alignment: .top)

                Circle()
                    .fill(.white)
                    .frame(width: size.height * 0.36, height: size.height * 0.36)
                    .overlay(
                        Circle()
                            .fill(sgFlagRed)
                            .frame(width: size.height * 0.28, height: size.height * 0.28)
                            .offset(x: size.height * 0.09, y: -size.height * 0.05)
                    )
                    .position(x: size.width * 0.17, y: size.height * 0.27)

                ForEach(0..<5, id: \.self) { index in
                    FivePointedStar()
                        .fill(.white)
                        .frame(width: size.height * 0.14, height: size.height * 0.14)
                        .position(starPosition(index, size: size))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 2))
        }
        .aspectRatio(2, contentMode: .fit)
        .frame(width: 64)
    }

    private func starPosition(_ index: Int, size: CGSize) -> CGPoint {
        let center = CGPoint(x: size.width * 0.30, y: size.height * 0.26)
        let radius = size.height * 0.15
        let angles: [Double] = [-90, -18, 54, 126, 198]
        let rad = angles[index] * .pi / 180

        return CGPoint(
            x: center.x + radius * cos(rad),
            y: center.y - radius * sin(rad)
        )
    }
}

private struct Hand: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .fill(skinTone)
                .frame(width: 26, height: 18)
                .offset(y: -22)

            RoundedRectangle(cornerRadius: 8)
                .fill(skinTone)
                .frame(width: 24, height: 28)
                .offset(y: 2)

            Capsule()
                .fill(skinTone)
                .frame(width: 6.5, height: 22)
                .offset(x: -9, y: 22)

            Capsule()
                .fill(skinTone)
                .frame(width: 6.5, height: 22)
                .offset(x: -3, y: 22)

            Capsule()
                .fill(skinTone)
                .frame(width: 6.5, height: 22)
                .offset(x: 3, y: 22)

            Capsule()
                .fill(skinTone)
                .frame(width: 6.5, height: 22)
                .offset(x: 9, y: 22)

            Capsule()
                .fill(skinTone)
                .frame(width: 8, height: 16)
                .rotationEffect(.degrees(-45))
                .offset(x: 14, y: -2)

            Capsule()
                .fill(skinTone)
                .frame(width: 6.5, height: 24)
                .offset(x: -12, y: 6)
                .overlay(
                    Capsule()
                        .stroke(skinShadow, lineWidth: 1)
                )
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .fill(.clear)
                .stroke(skinShadow, lineWidth: 1.5)
                .frame(width: 24, height: 28)
                .offset(y: 2)
        )
    }
}

var rightArm: some BodyPart {
    RightArm {
        RightUpperArmSegment {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(
                        LinearGradient(
                            colors: [armyRed, armyRedDark],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(armorOutline, lineWidth: 2)
                    )
                    .frame(width: 30, height: 130)

                Capsule()
                    .fill(.white.opacity(0.18))
                    .frame(width: 6, height: 80)
                    .offset(x: 9, y: -14)

                Rectangle()
                    .fill(.white)
                    .frame(width: 30, height: 9)
                    .offset(y: 46)

                Rectangle()
                    .fill(.white)
                    .frame(width: 24, height: 7)
                    .offset(y: 56)

                Rectangle()
                    .fill(.white)
                    .frame(width: 14, height: 6)
                    .offset(y: 65)
            }
        }
    } foreArm: {
        RightLowerArmSegment {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(
                        LinearGradient(
                            colors: [armyRedDark, armyRed],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(armorOutline, lineWidth: 2)
                    )
                    .frame(width: 30, height: 130)

                Capsule()
                    .fill(.white.opacity(0.14))
                    .frame(width: 5, height: 70)
                    .offset(x: -10, y: -10)

                SGFlagTattoo()
                    .rotationEffect(.degrees(-7))
                    .offset(y: 10)
                    .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)

                Hand()
                    .offset(y: 52)
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 400)) {
    rightArm
}
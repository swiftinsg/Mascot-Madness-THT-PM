import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

var head: some BodyPart {
    Head {
        ZStack {
                        VStack {
                                ZStack {
                                        Rectangle()
                                            .foregroundStyle(Color(red: 1.0, green: 0.3, blue: 0.5))
                                            .frame(width: 200, height: 100)
                                            .padding(-5)
                                        HStack {
                                                Image(systemName: "moon.fill")
                                                    .resizable()
                                                    .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                                    .rotationEffect(.degrees(40))
                                                    .scaledToFit()
                                                    .frame(width: 60)
                                                    .offset(x: -20, y: -2)
                                                    .padding(-25)
                                                ZStack {
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                            .offset(x: -12, y: 12)
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                            .offset(x: -20, y: -10)
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                            .offset(x: 12, y: 12)
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                            .offset(x: 20, y: -10)
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                            .offset(x: 0, y: -25)
                                                    }
                                                .padding(0)
                                            }.offset(x: -25)
                                    }
                                Rectangle()
                                    .foregroundStyle(Color(red: 1.0, green: 0.9, blue: 0.95))
                                .frame(width: 200, height: 100)
                                .padding(-5)
                            }
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 5)
                    
            
            Triangle()
                .frame(width: 30, height: 30)
                .offset(x: -45, y: -20)
                .foregroundStyle(.black)
            Triangle()
                .frame(width: 30, height: 30)
                .offset(x: 45, y: -20)
                .foregroundStyle(.black)
            
            Path { path in
                path.move(to: CGPoint(x: 65, y: 120))
                path.addQuadCurve(
                    to: CGPoint(x: 135, y: 120),
                    control: CGPoint(x: 100, y: 155)
                )
            }
            .stroke(.black, lineWidth: 5)
        }
        .frame(width: 200, height: 200)
    }
    
}


#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    head
}

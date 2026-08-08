import SwiftUI

var legs: some BodyPart {
    Legs {
        ZStack {
            Image("legs-image")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    legs
}

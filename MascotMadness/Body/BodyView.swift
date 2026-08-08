import SwiftUI

var torso: some BodyPart {
    Torso {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Circle() .stroke(Color.red, lineWidth: 4)
                .frame(width: 200, height: 200)
                
            
            
            Image("ND")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(x:-5,y:0)
            
            
            
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    torso
}

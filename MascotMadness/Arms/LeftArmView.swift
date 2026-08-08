import SwiftUI

var leftArm: some BodyPart {
    LeftArm {
        LeftUpperArmSegment {
            ZStack {
                
                Image(.lala)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
            }
        }
    } foreArm: {
        LeftLowerArmSegment {
            
            }
        }
    }


#Preview(traits: .fixedLayout(width: 200, height: 400)) {
    leftArm
}

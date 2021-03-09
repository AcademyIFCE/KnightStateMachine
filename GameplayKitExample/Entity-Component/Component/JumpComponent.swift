//
//  JumpComponent.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 06/03/21.
//

import Foundation
import GameplayKit

class JumpComponent: GKComponent {

    let impulse: CGFloat

    var animatedSpriteComponent: AnimatedSpriteComponent? {
        self.entity?.component(ofType: AnimatedSpriteComponent.self)
    }

    init(impulse: CGFloat) {
        self.impulse = impulse
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func jump(completion: @escaping () -> Void = { }) {
        let sequence = SKAction.sequence([
            SKAction.move(by: CGVector(dx: 0, dy: impulse), duration: 0.75),
            SKAction.move(by: CGVector(dx: 0, dy: -impulse), duration: 0.75)
        ])
        sequence.duration = 1.5
        sequence.timingMode = .easeIn
        
        animatedSpriteComponent?.spriteNode.run(sequence, completion: completion)
    }
}

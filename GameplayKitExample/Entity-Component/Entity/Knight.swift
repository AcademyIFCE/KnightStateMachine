//
//  Knight.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import GameplayKit

//Sprites Gratuitos
//https://www.gameart2d.com/the-knight-free-sprites.html

class Knight: GKEntity {

    override init() {
        super.init()
        self.addComponent(AnimatedSpriteComponent(atlasName: "IdleSprites"))

        self.addComponent(
            PlayerControlComponent(states: [
                IdleState(self),
                WalkLeftState(self),
                WalkRightState(self),
                JumpState(self),
                AttackState(self)
            ])
        )

        self.addComponent(WalkComponent())
        self.addComponent(AttackComponent(min: 50, max: 100))
        self.addComponent(JumpComponent(impulse: 600))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

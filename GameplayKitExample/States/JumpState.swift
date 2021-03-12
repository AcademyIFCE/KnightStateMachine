//
//  JumpState.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class JumpState: GKState {
    var entity: GKEntity

    init(_ entity: GKEntity){
        self.entity = entity
        super.init()
    }

    var animatedSpriteComponent: AnimatedSpriteComponent? {
        self.entity.component(ofType: AnimatedSpriteComponent.self)
    }

    var jumpComponent: JumpComponent? {
        self.entity.component(ofType: JumpComponent.self)
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)

        print("JumpState")

        animatedSpriteComponent?.setAnimation(atlasName: "JumpSprites")
        jumpComponent?.jump(completion: {
            self.stateMachine?.enter(IdleState.self)
        })
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        super.isValidNextState(stateClass)
        return stateClass == IdleState.self
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}

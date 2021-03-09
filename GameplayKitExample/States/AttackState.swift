//
//  AttackState.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class AttackState: GKState {
    var entity: GKEntity

    init(_ entity: GKEntity){
        self.entity = entity
        super.init()
    }

    var animatedSpriteComponent: AnimatedSpriteComponent? {
        self.entity.component(ofType: AnimatedSpriteComponent.self)
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        print("AttackState")
        animatedSpriteComponent?.setAnimation(atlasName: "AttackSprites")
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}

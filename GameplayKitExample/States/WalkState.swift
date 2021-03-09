//
//  WalkState.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class WalkLeftState: WalkState {
    override var direction: PanDirection {
        .left
    }
}

class WalkRightState: WalkState {
    override var direction: PanDirection {
        .right
    }
}

class WalkState: GKState {
    var entity: GKEntity
    
    var direction: PanDirection {
        .none
    }

    var animatedSpriteComponent: AnimatedSpriteComponent? {
        self.entity.component(ofType: AnimatedSpriteComponent.self)
    }

    var walkComponent: WalkComponent? {
        self.entity.component(ofType: WalkComponent.self)
    }

    init(_ entity: GKEntity){
        self.entity = entity
        super.init()
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        print("WalkState")

        animatedSpriteComponent?.setAnimation(atlasName: "WalkSprites")
        walkComponent?.walk(direction: direction)
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}

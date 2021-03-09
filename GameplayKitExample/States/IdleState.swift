//
//  IdleState.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class IdleState: GKState {
    var entity: GKEntity

    private var timeRemaining: TimeInterval = 10

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
        print("IdleState")
        self.timeRemaining = 10

        animatedSpriteComponent?.setAnimation(atlasName: "IdleSprites")
        walkComponent?.halt()
    }

    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)
        //quando ele tiver saindo
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}


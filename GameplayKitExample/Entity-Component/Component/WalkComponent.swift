//
//  WalkComponent.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 06/03/21.
//

import Foundation
import GameplayKit

class WalkComponent: GKComponent {

    var direction: PanDirection = .none

    var spriteNode: SKSpriteNode? {
        self.entity?.component(ofType: AnimatedSpriteComponent.self)?.spriteNode
    }

    func walk(direction: PanDirection) {
        self.direction = direction
    }

    func halt() {
        self.direction = .none
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)

        switch direction {
        case .left:
            spriteNode?.xScale = -1
            spriteNode?.position.x -= 10

        case .right:
            spriteNode?.xScale = 1
            spriteNode?.position.x += 10
            
        default:
            break
        }
    }
}

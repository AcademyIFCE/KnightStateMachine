//
//  GameScene.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let knight = Knight()
    let ground = Ground(numberOfTiles: 15)

    var playerControlComponent: PlayerControlComponent? {
        knight.component(ofType: PlayerControlComponent.self)
    }

    lazy var sceneCamera: SKCameraNode = {
        let camera = SKCameraNode()
        camera.setScale(3500)
        return camera
    }()

    private var previousUpdateTime: TimeInterval = TimeInterval()

    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(attack))
    lazy var panGesture = UIPanGestureRecognizer(target: self, action: #selector(walk))

    // MARK: - Gesture Actions
    @objc func attack(_ sender: UITapGestureRecognizer) {
        playerControlComponent?.attack()
    }

    @objc func walk(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            playerControlComponent?.handle(direction: sender.direction)

        case .ended:
            playerControlComponent?.halt()

        default:
            break
        }
    }

    // MARK: - SKScene Life-Cycle
    override func didMove(to view: SKView) {

        //Camera
        self.camera = sceneCamera

        //Nodes
        self.setupNodesPosition()

        //Gestures
        view.addGestureRecognizer(panGesture)
        view.addGestureRecognizer(tapGesture)

        //General Configuration
        self.backgroundColor = .brown
    }

    override func willMove(from view: SKView) {
        super.willMove(from: view)
        view.removeGestureRecognizer(panGesture)
        view.removeGestureRecognizer(tapGesture)
    }

    override func update(_ currentTime: TimeInterval) {
        self.sceneCamera.position = knight.component(ofType: AnimatedSpriteComponent.self)!.spriteNode.position

        let timeSincePreviousUpdate = currentTime - previousUpdateTime
        playerControlComponent?.update(deltaTime: timeSincePreviousUpdate)
        previousUpdateTime = currentTime
    }

    // MARK: - Adding Nodes to Scene
    func setupNodesPosition() {

        //acessing nodes from AnimatedSpriteComponents
        guard let knightSpriteNode = knight.component(ofType: AnimatedSpriteComponent.self)?.spriteNode,
              let groundTileRowComponent = ground.component(ofType: TileRowComponent.self) else {
            return
        }

        //positioning knight
        knightSpriteNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        //positioning ground tiles
        let tileCount = groundTileRowComponent.tileNodes.count
        let groundTileNodes: [SKSpriteNode] = groundTileRowComponent.tileNodes.enumerated().map { (index, node) in
            let offset = CGFloat(tileCount/2 - index)
            node.position = CGPoint(
                x: knightSpriteNode.position.x + node.texture!.size().width * offset,
                y: knightSpriteNode.frame.minY - knightSpriteNode.frame.height/7.5
            )
            return node
        }

        //adding nodes to scene
        for groundNode in groundTileNodes {
            self.addChild(groundNode)
        }

        self.addChild(knightSpriteNode)
    }

}

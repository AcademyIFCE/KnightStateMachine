//
//  GameViewController.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    let skView: SKView = SKView()

    override func loadView() {
        super.loadView()
        self.view = skView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene: SKScene = GameScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .aspectFill
        self.skView.presentScene(scene)
    }

}

//
//  TileRowComponent.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import GameplayKit

class TileRowComponent: GKComponent {

    let numberOfTiles: Int
    var tileNodes: [SKSpriteNode] = []

    init(numberOfTiles tiles: Int, assetName: String) {
        self.numberOfTiles = tiles
        for _ in 0..<tiles {
            self.tileNodes.append(SKSpriteNode(imageNamed: assetName))
        }
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

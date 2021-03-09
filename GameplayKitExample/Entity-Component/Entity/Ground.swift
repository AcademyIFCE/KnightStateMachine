//
//  Ground.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 05/03/21.
//

import Foundation
import GameplayKit

class Ground: GKEntity {

    init(numberOfTiles: Int) {
        super.init()
        self.addComponent(TileRowComponent(numberOfTiles: numberOfTiles, assetName: "GroundTile"))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
//  AttackComponent.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 06/03/21.
//

import Foundation
import GameplayKit

class AttackComponent: GKComponent {

    var minimumDamage: Int = 10
    var maximumDamage: Int = 50

    init(min: Int, max: Int) {
        self.minimumDamage = min
        self.maximumDamage = max
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var weaponDamage: Int {
        Int.random(in: minimumDamage...maximumDamage)
    }

    func attack(_ targetEntity: GKEntity) {
        //acessa health da targetEntity e decrementa de acordo com o weaponDamage
    }

}

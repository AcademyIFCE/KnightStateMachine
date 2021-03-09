//
//  PlayerControlComponent.swift
//  GameplayKitExample
//
//  Created by Gabriela Bezerra on 06/03/21.
//

import Foundation
import GameplayKit

class PlayerControlComponent: GKComponent {

    var stateMachine: GKStateMachine

    init(states: [GKState]) {
        self.stateMachine = GKStateMachine(states: states)
        self.stateMachine.enter(IdleState.self)
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func handle(direction: PanDirection) {
        guard stateMachine.currentState!.classForCoder != JumpState.self else { return }

        switch direction {
        case .right: moveRight()
        case .left: moveLeft()
        case .up: jump()

        default: break
        }
    }

    func halt() {
        guard stateMachine.currentState!.classForCoder != JumpState.self else { return }

        stateMachine.enter(IdleState.self)
    }

    func attack() {
        guard stateMachine.currentState!.classForCoder != JumpState.self else { return }

        stateMachine.enter(AttackState.self)
    }

    private func moveLeft() {
        stateMachine.enter(WalkLeftState.self)
    }

    private func moveRight() {
        stateMachine.enter(WalkRightState.self)
    }

    private func jump() {
        stateMachine.enter(JumpState.self)
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)

        self.entity?.component(ofType: WalkComponent.self)?.update(deltaTime: seconds)
    }
}

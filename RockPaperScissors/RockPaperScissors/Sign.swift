//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Jesús Tirado on 8/17/18.
//  Copyright © 2018 tiradOS. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign () -> Sign {
    let sign = randomChoice.nextInt()

    if sign == 0 {
        return . rock

    }else if sign == 1 {
        return .paper
    }else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors

    var emoji : String {
        switch self {
        case .rock:
            return "👊🏼"
        case .paper:
            return "✋🏼"
        case .scissors:
            return "✌🏼"

        }
    }

    func takeTurn(_ opponent: Sign) -> gameState {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return gameState.empate
            case .paper:
                return gameState.perdiste
            case .scissors:
                return gameState.ganaste
            }
        case .paper:
            switch opponent {
            case .rock:
                return gameState.ganaste
            case .paper:
                return gameState.empate
            case .scissors:
                return gameState.perdiste
            }

        case .scissors:
            switch opponent {
            case .rock:
                return gameState.perdiste
            case .paper:
                return gameState.ganaste
            case .scissors:
                return gameState.empate
            }
        }

    }

}

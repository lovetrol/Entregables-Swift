//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Jesús Tirado on 8/17/18.
//  Copyright © 2018 tiradOS. All rights reserved.
//

import UIKit
import GameplayKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var computerLabel: UILabel!


    @IBOutlet weak var statusLabel: UILabel!

    @IBOutlet weak var rockButton: UIButton!

    @IBOutlet weak var paperButton: UIButton!


    @IBOutlet weak var scissorsButton: UIButton!


    @IBOutlet weak var playAgainButton: UIButton!


    var currentGameState: gameState = gameState.comenzar


    override func viewDidLoad() {
        super.viewDidLoad()

        resetBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func resetBoard() {
        computerLabel.text = "👾"
        statusLabel.text = "¿Piedra, Papel  ó tijera?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true

        playAgainButton.isHidden = true
    }


    func play(_ playerTurn: Sign ) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false


        let opponent = randomSign()
        computerLabel.text = opponent.emoji

        currentGameState = playerTurn.takeTurn(opponent)

        switch currentGameState {
        case .empate:
            statusLabel.text = "Es un empate"
        case .perdiste:
            statusLabel.text = "Perdedoooor!"
        case .ganaste:
            statusLabel.text = "Ganaste, eres un crack!"
        case .comenzar:
            statusLabel.text = "¿Piedra, Papel  ó tijera?"
        }

        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true

        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false

        }
        playAgainButton.isHidden = false
    }


    @IBAction func playAgainSelected(_ sender: Any) {
        resetBoard()
    }
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
    }

    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }

    @IBAction func scissorsSelected(_ sender: Any) {
        play(Sign.scissors)
    }

}

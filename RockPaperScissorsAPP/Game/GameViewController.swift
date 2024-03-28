//
//  GameViewController.swift
//  RockPaperScissorsAPP
//
//  Created by Cristian guillermo Romero garcia on 14/10/23.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: Variables
    var nameInGame: String = ""
    var rounds: Int = 0
    var pointsToWin: Int = 0
    var pointsWinned: Int = 0
    var pointsLosed: Int = 0
    var points: Int = 0
    var numberOfRounds: Int = 0
    var gameMode: String = ""
    var gameStatus: String = ""
    var gameStatusArray: [String] = []
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gameAreaView: UIView!
    @IBOutlet weak var divideGameAreaView: UIView!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var gameChooseDescriptionLabel: UILabel!
    @IBOutlet weak var gameChooseLabel: UILabel!
    @IBOutlet weak var playerChooseDescriptionLabel: UILabel!
    @IBOutlet weak var playerChooseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsRoundsLabel: UILabel!
    @IBOutlet weak var pointsRoundsValueLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var pointsValueLabel: UILabel!
    @IBOutlet weak var nextTurnLabel: UIButton!
    @IBOutlet weak var historyLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        print("Game")
        print("RONDAS: \(rounds)")
    }
    
    private func setUpUI(){
        titleLabel.text = "Elije tu tirada"
        titleLabel.textAlignment = .center
        gameAreaView.layer.cornerRadius = 10
        gameAreaView.layer.borderWidth = 2
        gameAreaView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        gameAreaView.backgroundColor = .cyan
        divideGameAreaView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        playerChooseDescriptionLabel.text = ""
        gameChooseLabel.text = ""
        gameChooseDescriptionLabel.text = "Mi tirada"
        playerChooseLabel.text = "Tu tirada"
        nameLabel.text = "Nombre del jugador: \(nameInGame)"
        
        if gameMode == "Puntos"{
            pointsValueLabel.text = ""
            pointsLabel.isHidden = false
            pointsRoundsValueLabel.text = "\(pointsToWin)"
        }else{
            pointsRoundsLabel.text = "Rondas seleccionadas"
            pointsLabel.isHidden = true
            pointsValueLabel.text = ""
            pointsRoundsValueLabel.text = "\(rounds)"
        }
        
        nextTurnLabel.isEnabled = false
    }
    
    @IBAction func rockbuttonDidPressed(_ sender: UIButton) {
        GameChoose()
        playerChooseDescriptionLabel.text = "👊🏻"
        gameStarted()
        GameLoop()
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        nextTurnLabel.isEnabled = true

        
    }
    
    @IBAction func papperButtonDidPressed(_ sender: Any) {
        GameChoose()
        playerChooseDescriptionLabel.text = "✋🏻"
        gameStarted()
        GameLoop()
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        nextTurnLabel.isEnabled = true
       
    }
    
    @IBAction func scissorButtonDidPressed(_ sender: Any) {
        GameChoose()
        playerChooseDescriptionLabel.text = "✌🏻"
        gameStarted()
        GameLoop()
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        nextTurnLabel.isEnabled = true

        
    }
    
    @IBAction func nextTurnButtonIsPressed(_ sender: Any) {
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorButton.isEnabled = true
        nextTurnLabel.isEnabled = false
    }
    
    
    @IBAction func historyButtonIsPressed(_ sender: Any) {
        let historyViewController = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        historyViewController.status = gameStatusArray
        historyViewController.name = nameInGame
        historyViewController.mode = gameMode
        historyViewController.state = gameStatus
        let historyNavigation = UINavigationController(rootViewController: historyViewController)
        self.present(historyNavigation, animated: true)
        
        
    }
    
    func GameChoose(){
        let choose = Int.random(in: 1...3)
        if choose == 1{
            gameChooseLabel.text = "👊🏻"
        }else if choose == 2{
            gameChooseLabel.text = "✋🏻"
        }
        else {
            gameChooseLabel.text = "✌🏻"
        }
    }
    
    func gameStarted(){
        if playerChooseDescriptionLabel.text != gameChooseLabel.text{
            if playerChooseDescriptionLabel.text == "👊🏻" && gameChooseLabel.text == "✋🏻" {
                print("Perdiste")
                gameStatus = "Perdiste"
                view.backgroundColor = .red
                gameStatusArray.append(gameStatus)
                
            }else if playerChooseDescriptionLabel.text == "👊🏻" && gameChooseLabel.text == "✌🏻" {
                GameChoose()
                print("Ganaste")
                gameStatus = "Ganaste"
                view.backgroundColor = .green
                gameStatusArray.append(gameStatus)
                
            }else if playerChooseDescriptionLabel.text == "✋🏻" && gameChooseLabel.text == "✌🏻"{
                print("Perdiste")
                gameStatus = "Perdiste"
                view.backgroundColor = .red
                gameStatusArray.append(gameStatus)
                
            }else if playerChooseDescriptionLabel.text == "✋🏻" && gameChooseLabel.text == "👊🏻"{
                print("Ganaste")
                gameStatus = "Ganaste"
                view.backgroundColor = .green
                gameStatusArray.append(gameStatus)
                
            }else if playerChooseDescriptionLabel.text == "✌🏻" && gameChooseLabel.text == "👊🏻"{
                print("Perdiste")
                gameStatus = "Perdiste"
                view.backgroundColor = .red
                gameStatusArray.append(gameStatus)
                
            }else if playerChooseDescriptionLabel.text == "✌🏻" && gameChooseLabel.text == "✋🏻"{
                print("Ganaste")
                gameStatus = "Ganaste"
                view.backgroundColor = .green
                gameStatusArray.append(gameStatus)
                
            }
        }else{
            print("empate")
            view.backgroundColor = .brown
            gameStatus = "Empate"
            gameStatusArray.append(gameStatus)
            
        }
        
    }
    
    func GameLoop(){
        if gameMode == "Puntos" {
            pointsRoundsLabel.text = "Puntos para ganar"
            pointsRoundsValueLabel.text = "\(pointsToWin)"
            pointsLabel.text = "Puntos"
            if gameStatus == "Ganaste"{
                points = points + pointsWinned
                print("Puntos: \(points)")
            }else if gameStatus == "Perdiste"{
                if points < pointsLosed {
                    points = 0
                    print("Puntos: \(points)")
                }else{
                    points = points - pointsLosed
                    print("Puntos: \(points)")
                }
            }else{
                print("Puntos: \(points)")
            }
            if points >= pointsToWin{
                showGameFinishAlert()
            }
            pointsValueLabel.text = "\(points)"
        
        }else{
            pointsRoundsLabel.text = "Rondas seleccionadas"
            pointsRoundsValueLabel.text = "\(rounds)"
            pointsLabel.isHidden = true
            pointsValueLabel.isHidden = true
            numberOfRounds += 1
            if numberOfRounds == rounds{
                showGameFinishAlert()
            }
        }
    }
    
    func showGameFinishAlert(){
        let errorTitle = "Juego terminado"
        let errorMessage = "Elige Aceptar para reiniciar"
        let alertController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        let aceptAction = UIAlertAction(title: "Aceptar", style: .default){_ in
            self.resetGame()
        }
        alertController.addAction(aceptAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func resetGame(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

//
//  ConfigurationViewController.swift
//  RockPaperScissorsAPP
//
//  Created by Cristian guillermo Romero garcia on 14/10/23.
//

import UIKit

class ConfigurationViewController: UIViewController, UITextFieldDelegate {
    //MARK: Variables
    var nameInConfiguration: String = ""

   // MARK: Outlets
    @IBOutlet weak var gameTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameDescriptionLabel: UILabel!
    @IBOutlet weak var configurationView: UIView!
    @IBOutlet weak var pointsToWinLabel: UILabel!
    @IBOutlet weak var pointsToWinTextField: UITextField!
    @IBOutlet weak var pointsForEachVictoryLabel: UILabel!
    @IBOutlet weak var pointsForEachVictoryTextfield: UITextField!
    @IBOutlet weak var lostPointsForEachGameLostLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var lostPointsForEachGameLostTextField: UITextField!
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var roundSelectionDescriptionLabel: UILabel!
    @IBOutlet weak var roundsValueLabel: UILabel!
    @IBOutlet weak var roundsValueSlider: UISlider!
    @IBOutlet weak var gameModeLabel: UILabel!
    @IBOutlet weak var roundInstructionLabel: UILabel!
    @IBOutlet weak var roundMinValue: UILabel!
    @IBOutlet weak var roundMaxValue: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
   
    
    //MARK: Actions
    
    @IBAction func SegmentedIdChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            DisplayRoundsConfiguration()
        }else{
            DisplayPointsConfiguration()
        }
    }
    
    
    @IBAction func sliderValueChane(_ sender: Any) {
        roundsValueLabel.text = "\(Int(roundsValueSlider.value))"
    }
    
    
    @IBAction func playGameButtonPressed(_ sender: Any) {
        presentGameModule()
    }
    
    @IBAction func infoButtonDidPressed(_ sender: Any) {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
    
    //Mark: Functions
    func setUpUI(){
        
        //MARK: Screen Properties
        self.title  = "Configuración del juego"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        //MARK: Game properties
        gameModeLabel.text = "Juego por rondas"
        gameModeLabel.textColor = .systemRed
        //MARK: User data properties
        nameDescriptionLabel.text = "Ingresa tu nombre"
        nameDescriptionLabel.textColor = .black
        nameTextField.placeholder = "Nombre"
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        nameTextField.layer.cornerRadius = 10
        
        //MARK: Configuration data properties
        configurationView.layer.borderWidth = 2
        configurationView.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        configurationView.layer.cornerRadius = 10
        pointsToWinTextField.placeholder = "Puntos para ganar"
        pointsToWinTextField.keyboardType = .numberPad
        pointsForEachVictoryTextfield.placeholder = "Puntos ganados"
        pointsForEachVictoryTextfield.keyboardType = .numberPad
        lostPointsForEachGameLostTextField.placeholder = "Puntos perdidos"
        lostPointsForEachGameLostTextField.keyboardType = .numberPad
        
        
        
        //MARK: Game for rounds properties
        roundSelectionDescriptionLabel.text = "Rondas seleccionadas"
        roundsValueLabel.text = "1"
        pointsToWinLabel.isHidden = true
        pointsToWinLabel.text = "Ingresa cuantos puntos debes obtener para ganar"
        pointsToWinLabel.numberOfLines = 0
        pointsToWinTextField.isHidden = true
        pointsForEachVictoryLabel.isHidden = true
        pointsForEachVictoryLabel.text = "Ingresa cuantos puntos obtendras por victoria"
        pointsForEachVictoryLabel.numberOfLines = 0
        pointsForEachVictoryTextfield.isHidden = true
        lostPointsForEachGameLostLabel.isHidden = true
        lostPointsForEachGameLostLabel.text = "Ingresa cuantos puntos perderas por cada derrota"
        lostPointsForEachGameLostLabel.numberOfLines = 0
        lostPointsForEachGameLostTextField.isHidden = true
        roundMinValue.text = "1"
        roundMaxValue.text = "5"
        roundInstructionLabel.text = "Desliza para elegir el numero de rondas "
        roundsValueSlider.minimumValue = 1
        roundsValueSlider.maximumValue = 5
        roundsValueSlider.value = 1
        
        //MARK: Button Properties
        playGameButton.setTitle("¡ A JUGAR !", for: .normal)
        playGameButton.layer.cornerRadius = 10
        playGameButton.layer.borderWidth = 2
        playGameButton.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        playGameButton.backgroundColor = .systemRed
        playGameButton.setTitleColor(.white, for: .normal)
        
        infoButton.setTitle("No se jugar!!", for: .normal)
        
    }
    
    func DisplayRoundsConfiguration(){
        gameModeLabel.text = "Juego por rondas"
        gameModeLabel.textColor = .red
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        configurationView.layer.borderWidth = 2
        configurationView.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        pointsToWinLabel.isHidden = true
        pointsToWinTextField.isHidden = true
        pointsForEachVictoryLabel.isHidden = true
        pointsForEachVictoryTextfield.isHidden = true
        lostPointsForEachGameLostLabel.isHidden = true
        lostPointsForEachGameLostTextField.isHidden = true
        roundsValueSlider.isHidden = false
        roundSelectionDescriptionLabel.isHidden = false
        roundsValueLabel.isHidden = false
        playGameButton.layer.cornerRadius = 10
        playGameButton.layer.borderWidth = 2
        playGameButton.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        playGameButton.backgroundColor = .systemRed
        playGameButton.setTitleColor(.white, for: .normal)
        roundMinValue.isHidden = false
        roundMaxValue.isHidden = false
        roundInstructionLabel.isHidden = false
    }
    
    func DisplayPointsConfiguration(){
        gameModeLabel.text = "Juego por puntos"
        gameModeLabel.textColor = .blue
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 1)
        configurationView.layer.borderWidth = 2
        configurationView.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 1)
        pointsToWinLabel.isHidden = false
        pointsToWinTextField.isHidden = false
        pointsForEachVictoryLabel.isHidden = false
        pointsForEachVictoryTextfield.isHidden = false
        lostPointsForEachGameLostLabel.isHidden = false
        lostPointsForEachGameLostTextField.isHidden = false
        roundsValueSlider.isHidden = true
        roundSelectionDescriptionLabel.isHidden = true
        roundsValueLabel.isHidden = true
        playGameButton.layer.cornerRadius = 10
        playGameButton.layer.borderWidth = 2
        playGameButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 1)
        playGameButton.backgroundColor = .systemBlue
        playGameButton.setTitleColor(.white, for: .normal)
        roundMinValue.isHidden = true
        roundMaxValue.isHidden = true
        roundInstructionLabel.isHidden = true
    }
    
    func presentGameModule(){
        guard let name = nameTextField.text,
              let pointsToWin = pointsToWinTextField.text,
              let pointWinned = pointsForEachVictoryTextfield.text,
              let pointsLosed = lostPointsForEachGameLostTextField.text
        else {return}
        if gameTypeSegmentedControl.selectedSegmentIndex == 0{
            if name.isEmpty == false && roundsValueSlider.value > 0{
                let gameStoryboard = UIStoryboard(name: "GameStoryboard", bundle: .main)
                let gameViewController = gameStoryboard.instantiateViewController(withIdentifier: "GameVC") as! GameViewController
                self.navigationController?.pushViewController(gameViewController, animated: true)
                gameViewController.nameInGame = name
                gameViewController.rounds = Int(roundsValueSlider.value)
                print(name)
                print("\(roundsValueSlider.value)")
                print("Juego por rondas")
                gameViewController.title = "Juego por rondas"
                gameViewController.gameMode = "Rondas"
            }else{
                showAlertLabel()
            }
        }else{
            if name.isEmpty == false && pointWinned.isEmpty == false && pointsToWin.isEmpty == false && pointsLosed.isEmpty == false{
                let gameStoryboard = UIStoryboard(name: "GameStoryboard", bundle: .main)
                let gameViewController = gameStoryboard.instantiateViewController(withIdentifier: "GameVC") as! GameViewController
                self.navigationController?.pushViewController(gameViewController, animated: true)
                gameViewController.nameInGame = name
                gameViewController.pointsToWin = Int(pointsToWin)!
                gameViewController.pointsWinned = Int(pointWinned)!
                gameViewController.pointsLosed = Int(pointsLosed)!
                print("Juego de puntos")
                gameViewController.title = "Juego por puntos"
                gameViewController.gameMode = "Puntos"
            }else{
                showAlertLabel()
            }
        }
    }
    
    func showAlertLabel(){
        let errorTitle = "Error"
        let errorMessage = "LLena los campos Vacios!"
        let alertController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        let aceptAction = UIAlertAction(title: "Aceptar", style: .default){_ in
            print("Did Select Acept !!")
        }
        alertController.addAction(aceptAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
   
    
    
}

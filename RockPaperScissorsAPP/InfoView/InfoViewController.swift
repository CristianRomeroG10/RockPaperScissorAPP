//
//  InfoViewController.swift
//  RockPaperScissorsAPP
//
//  Created by Cristian guillermo Romero garcia on 18/10/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var titlelabel: UILabel = {
        let titlelabel = UILabel()
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        return titlelabel
    }()
    
    private lazy var textView: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var acknowledgmentsTextView: UITextView = {
        let acknowledgmentstextView = UITextView()
        acknowledgmentstextView.translatesAutoresizingMaskIntoConstraints = false
        return acknowledgmentstextView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setElements()
        setUpUI()
    }
    
    private func setUpUI(){
        titlelabel.text = "Reglas de juego"
        titlelabel.textAlignment = .center
        titlelabel.font = .systemFont(ofSize: 20)
        textView.layer.borderWidth = 2
        textView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0 , alpha: 1)
        textView.layer.cornerRadius = 10
        textView.text = " Instrucciones:\nLos jugadores cuentan juntos «1, 2, 3…, ¡piedra, papel o tijera!»\nJusto al acabar muestran todos al mismo tiempo una de sus manos, de modo que pueda verse el elemento que cada uno ha elegido: \nPiedra: un puño cerrado. \nPapel: todos los dedos extendidos, con la palma de la mano de lado, mirando hacia abajo o hacia arriba \nTijera: dedos índice y corazón extendidos y separados formando una «V». \nEl objetivo es vencer al oponente seleccionando el arma que gana, según las siguientes reglas: \n -La piedra aplasta la tijera. (Gana la  piedra.) \n -La tijera corta el papel. (Gana la tijera.) \n -El papel envuelve la piedra. (Gana el papel.)En caso de empate (que dos jugadores elijan el mismo elemento o que tres jugadores elijan cada uno un objeto distinto), se juega otra vez. "
        textView.font = .systemFont(ofSize: 20)
        textView.textAlignment = .justified
        acknowledgmentsTextView.layer.borderWidth = 2
        acknowledgmentsTextView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        acknowledgmentsTextView.layer.cornerRadius = 10
        acknowledgmentsTextView.text = "Agradecimientos\nCristian Guillermo Romero Garcia"
        acknowledgmentsTextView.font = .systemFont(ofSize: 20)
    }
    
    private func setElements(){
        view.addSubview(titlelabel)
        view.addSubview(textView)
        view.addSubview(acknowledgmentsTextView)
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titlelabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            titlelabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            textView.bottomAnchor.constraint(equalTo: acknowledgmentsTextView.topAnchor, constant: -20),
            acknowledgmentsTextView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            acknowledgmentsTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            acknowledgmentsTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            acknowledgmentsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            acknowledgmentsTextView.heightAnchor.constraint(equalTo: textView.heightAnchor, multiplier: 0.3)
        ])
        
    }
    
    


}

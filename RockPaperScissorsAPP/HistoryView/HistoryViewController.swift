//
//  HistoryViewController.swift
//  RockPaperScissorsAPP
//
//  Created by Cristian guillermo Romero garcia on 21/10/23.
//

import UIKit

class HistoryViewController: UIViewController {
    var status: [String] = []
    var name: String = ""
    var mode: String = ""
    var state: String = ""
    
    @IBOutlet weak var historyTableView: UITableView!{
        didSet{
            historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Historial"
        setUPUI()
        historyTableView.dataSource = self

        
    }


    func setUPUI(){
        
    }

}
extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        status.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HistoryTableViewCell{
            cell.statusLabel.text = status[indexPath.row]
            cell.nameLabel.text = name
            cell.ModeLabel.text = mode
            
            if status[indexPath.row] == "Ganaste"{
                cell.backgroundColor = .green
            }else if status[indexPath.row] == "Perdiste"{
                cell.backgroundColor = .red
            }else{
                cell.backgroundColor = .brown
            }
        
            return cell
        }
        return UITableViewCell()
    }
    
}
extension HistoryViewController: UITableViewDelegate{
    
}

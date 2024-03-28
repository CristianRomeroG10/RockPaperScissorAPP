//
//  HistoryTableViewCell.swift
//  RockPaperScissorsAPP
//
//  Created by Cristian guillermo Romero garcia on 27/10/23.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ModeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  TwoLinesViewCell.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 11/05/23.
//

import UIKit

class TwoLinesViewCell: UITableViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

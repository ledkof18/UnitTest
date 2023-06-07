//
//  EmployeesViewCell.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 25/04/23.
//

import UIKit

class EmployeesViewCell: UITableViewCell {
    
    @IBOutlet weak var employeeIDLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  EmployeesDetailViewController.swift
//  Apple
//
//  Created by Luis Enrique on 05/25/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

class EmployeesDetailViewController: UIViewController{
    var presenter: EmployeesDetailPresenterProtocol?
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelSpecie: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    
    var dataCharacters: Character?
    
    static func viewController() -> EmployeesDetailViewController{
        let storyboard  = UIStoryboard(name: "EmployeesViper", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "EmployeesDetailViewController") as? EmployeesDetailViewController else {
            return EmployeesDetailViewController()
        }
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dataCharacters = dataCharacters{
            presenter?.onViewLoaded()
            self.updateData(data: dataCharacters)
        }
    }
    
    @IBAction func onEpisodeTap(_ sender: UIButton) {}
}

extension EmployeesDetailViewController: EmployeesDetailViewControllerProtocol{
    func updateData(data: Character) {
        labelName.text = "Nombre: \(data.name)"
        labelStatus.text = "Estado: \(data.status)"
        labelSpecie.text = "Especie: \(data.species)"
        labelGender.text = "Género: \(data.gender)"
        imageHeader.downImage(urlString: data.image, placeholder: "placeholderImage")
    }
}

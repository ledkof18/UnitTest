//
//  EmployeesDetailPresenter.swift
//  Apple
//
//  Created by Luis Enrique on 05/25/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

class EmployeesDetailPresenter: EmployeesDetailPresenterProtocol, EmployeesDetailInteractorOutputProtocol {
    
    weak var viewController: EmployeesDetailViewControllerProtocol?
    var interactor: EmployeesDetailInteractorInputProtocol?
    var wireFrame: EmployeesDetailWireFrameProtocol?

    init() {}
    
    func onViewLoaded() {
        guard let viewController = viewController as? EmployeesDetailViewController, let image = viewController.imageHeader else { return }
        image.layer.cornerRadius = 12.0
        image.layer.borderWidth = 2.0
        image.layer.borderColor = UIColor.black.cgColor
        
    }
    
//    func fetchFirstEpisode() {
//        interactor?.onFetchFirstEpisode(completion: { response in
//            self.viewController?.updateData(data: response)
//        })
//    }

}

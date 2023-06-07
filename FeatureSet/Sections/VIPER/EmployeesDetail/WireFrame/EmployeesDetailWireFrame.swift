//
//  EmployeesDetailWireFrame.swift
//  Apple
//
//  Created by Luis Enrique on 05/25/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

class EmployeesDetailWireFrame: EmployeesDetailWireFrameProtocol {
  
    class func createEmployeesDetailViewController() -> EmployeesDetailViewController{
        return EmployeesDetailViewController.viewController()
    }
    
    static func presentEmployeesDetailModule(fromView vc:UIViewController, character: Character) {

        // Generating module components
        let viewController = createEmployeesDetailViewController()
        viewController.dataCharacters = character
        let presenter: EmployeesDetailPresenterProtocol & EmployeesDetailInteractorOutputProtocol = EmployeesDetailPresenter()
        let interactor: EmployeesDetailInteractorInputProtocol = EmployeesDetailInteractor()
        let wireFrame: EmployeesDetailWireFrameProtocol = EmployeesDetailWireFrame()

        // Connecting
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        vc.navigationController?.pushViewController(viewController, animated: true)
    }
}

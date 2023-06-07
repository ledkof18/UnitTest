//
//  EmployeesViperWireFrame.swift
//  Apple
//
//  Created by Luis Enrique on 05/10/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

class EmployeesViperWireFrame: EmployeesViperWireFrameProtocol {

    class func createEmployeesViperViewController() -> EmployeesViperViewController{
        return EmployeesViperViewController.viewController()
    }
    
    static func presentEmployeesViperModule(fromView vc:UIViewController) {

        // Generating module components
        let viewController = createEmployeesViperViewController()
        viewController.title = "Employees"
        let presenter: EmployeesViperPresenterProtocol & EmployeesViperInteractorOutputProtocol = EmployeesViperPresenter()
        let interactor: EmployeesViperInteractorInputProtocol = EmployeesViperInteractor(httpClient: ApiService())
        let wireFrame: EmployeesViperWireFrameProtocol = EmployeesViperWireFrame()

        // Connecting
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        vc.navigationController?.pushViewController(viewController, animated: true)
    }
}

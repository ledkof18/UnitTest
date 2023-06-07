//
//  EmployeesViperProtocols.swift
//  Apple
//
//  Created by Luis Enrique on 05/10/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

protocol EmployeesViperViewControllerProtocol: AnyObject {
    var presenter: EmployeesViperPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol EmployeesViperWireFrameProtocol: AnyObject {
    static func presentEmployeesViperModule(fromView vc: UIViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol EmployeesViperPresenterProtocol: AnyObject {
    var viewController: EmployeesViperViewControllerProtocol? { get set }
    var interactor: EmployeesViperInteractorInputProtocol? { get set }
    var wireFrame: EmployeesViperWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func fetchData()
}

protocol EmployeesViperInteractorOutputProtocol: AnyObject {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol EmployeesViperInteractorInputProtocol: AnyObject
{
    var presenter: EmployeesViperInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func fetchCharacters(completion: @escaping(Characters) -> ())
}

protocol EmployeesViperDataManagerInputProtocol: AnyObject
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol EmployeesViperAPIDataManagerInputProtocol: AnyObject
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol EmployeesViperLocalDataManagerInputProtocol: AnyObject
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}

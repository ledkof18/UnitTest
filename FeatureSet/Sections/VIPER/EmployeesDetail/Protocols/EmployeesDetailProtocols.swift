//
//  EmployeesDetailProtocols.swift
//  Apple
//
//  Created by Luis Enrique on 05/25/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

protocol EmployeesDetailViewControllerProtocol: AnyObject {
    var presenter: EmployeesDetailPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func updateData(data: Character)
}

protocol EmployeesDetailWireFrameProtocol: AnyObject {
    static func presentEmployeesDetailModule(fromView vc: UIViewController, character: Character)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol EmployeesDetailPresenterProtocol: AnyObject {
    var viewController: EmployeesDetailViewControllerProtocol? { get set }
    var interactor: EmployeesDetailInteractorInputProtocol? { get set }
    var wireFrame: EmployeesDetailWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func onViewLoaded()
    //func fetchFirstEpisode()
}

protocol EmployeesDetailInteractorOutputProtocol: AnyObject {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol EmployeesDetailInteractorInputProtocol: AnyObject
{
    var presenter: EmployeesDetailInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func onFetchFirstEpisode(completion: @escaping(Characters) -> ())
}

protocol EmployeesDetailDataManagerInputProtocol: AnyObject
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol EmployeesDetailAPIDataManagerInputProtocol: AnyObject
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol EmployeesDetailLocalDataManagerInputProtocol: AnyObject
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}

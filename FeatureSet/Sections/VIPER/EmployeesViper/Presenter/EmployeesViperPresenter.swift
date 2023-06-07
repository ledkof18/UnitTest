//
//  EmployeesViperPresenter.swift
//  Apple
//
//  Created by Luis Enrique on 05/10/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation

class EmployeesViperPresenter: EmployeesViperPresenterProtocol, EmployeesViperInteractorOutputProtocol {
    weak var viewController: EmployeesViperViewControllerProtocol?
    var interactor: EmployeesViperInteractorInputProtocol?
    var wireFrame: EmployeesViperWireFrameProtocol?

    init() {}
        
    func fetchData() {
        guard let view = viewController as? EmployeesViperViewController else { return }
        interactor?.fetchCharacters(completion: { response in
            view.characters = response
            DispatchQueue.main.async {
                view.tableView.reloadData()
            }
        })
    }
}

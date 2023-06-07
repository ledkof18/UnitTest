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
        interactor?.fetchCharacters(completion: { response in
            self.viewController?.updateData(characters: response)
        })
    }
}

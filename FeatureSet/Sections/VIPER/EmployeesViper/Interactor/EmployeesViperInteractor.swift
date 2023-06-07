//
//  EmployeesViperInteractor.swift
//  Apple
//
//  Created by Luis Enrique on 05/10/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation

class EmployeesViperInteractor: EmployeesViperInteractorInputProtocol {

    weak var presenter: EmployeesViperInteractorOutputProtocol?
    
    var httpClient: HTTPClientProtocol!
    
    init(httpClient: HTTPClientProtocol){
        self.httpClient = httpClient
    }
    
    func fetchCharacters(completion: @escaping (Characters) -> ()) {
        let url = URLManager.EndPoint.employees()
        httpClient.fetch(url: url) { (response: Characters) in
            completion(response)
        }
    }
}




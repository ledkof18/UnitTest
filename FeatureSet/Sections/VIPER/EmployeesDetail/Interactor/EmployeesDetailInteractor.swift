//
//  EmployeesDetailInteractor.swift
//  Apple
//
//  Created by Luis Enrique on 05/25/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation

class EmployeesDetailInteractor: EmployeesDetailInteractorInputProtocol {

    weak var presenter: EmployeesDetailInteractorOutputProtocol?

    var apiService:  ApiService!
    
    init() {}
    
    func onFetchFirstEpisode(completion: @escaping (Characters) -> ()) {
        apiService = ApiService()
        let url = URLManager.EndPoint.employees()
        apiService.fetchFromAF(url: url) { (response: Characters) in
            completion(response)
        }
    }
}

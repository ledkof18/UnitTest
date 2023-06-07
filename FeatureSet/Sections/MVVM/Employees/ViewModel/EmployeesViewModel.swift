//
//  EmployeesViewModel.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 25/04/23.
//

import Foundation

class EmployeesViewModel: NSObject{
    // Varible para prueba unitaria
    @Published private(set) var empDataRx: Characters!
    
    var httpClient: HTTPClientProtocol!
    
    private(set) var empData: Characters!{
        didSet{
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController: (() -> ()) = {}
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func callFuncToGetEmpData() async throws{
        let url = URLManager.EndPoint.employees()
        let employees: Characters = try await self.httpClient.fetch(url: url)
        self.empData = employees
        self.empDataRx = employees
    }
}


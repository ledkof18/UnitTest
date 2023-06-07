//
//  EmployeesDetailPresenterMock.swift
//  FeatureSetTests
//
//  Created by Luis Enrique Diaz Ramirez on 31/05/23.
//

import Foundation
@testable import FeatureSet

class EmployeesDetailPresenterMock: EmployeesDetailPresenterProtocol{
    
    var viewController: FeatureSet.EmployeesDetailViewControllerProtocol?
    var interactor: FeatureSet.EmployeesDetailInteractorInputProtocol?
    var wireFrame: FeatureSet.EmployeesDetailWireFrameProtocol?
        
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
    
}

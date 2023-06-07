//
//  EmployeesViewModelTest.swift
//  FeatureSetTests
//
//  Created by Luis Enrique Diaz Ramirez on 12/05/23.
//

import XCTest
import Combine
@testable import FeatureSet

final class EmployeesViewModelTest: XCTestCase {
    
    var employeesViewModel: EmployeesViewModel!
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        employeesViewModel = EmployeesViewModel(httpClient: MockHTTPClient())
        cancellables = []
    }

    override func tearDownWithError() throws {
        employeesViewModel = nil
        cancellables = []
    }

    // Prueba unitaria para obtener el numero de elementos `empData` usando `Try await`
    func testFetchEmployeesSuccesfullyWithTry_Await() async throws{
        try await employeesViewModel.callFuncToGetEmpData()
        XCTAssertEqual(employeesViewModel.empData.results.count, 20)
        let firstEmployeeName = try XCTUnwrap(employeesViewModel.empData.results.first?.name)
        XCTAssertEqual(firstEmployeeName, "Luis Enrique")
        
    }

    // Prueba unitaria para obtener el numero de elementos `empDataRx` usando `Combine`
    func testFetchEmployeesSuccefullyWithCombine() async throws{
        let expectation = XCTestExpectation(description: "Fetched data")
        try await employeesViewModel.callFuncToGetEmpData()
        employeesViewModel
            .$empDataRx
            .sink { value in
                XCTAssertEqual(value?.results.count, 20)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
    }

}

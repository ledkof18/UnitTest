//
//  EmployeesDetailViewControllerTest.swift
//  FeatureSetTests
//
//  Created by Luis Enrique Diaz Ramirez on 31/05/23.
//

import XCTest
@testable import FeatureSet

final class EmployeesDetailViewControllerTest: XCTestCase {
    
    let presenter = EmployeesDetailPresenterMock()
    var sut: EmployeesDetailViewController!
    
    override func setUpWithError() throws {
        sut = makeSUT()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testUpdateData(){
        let newCharacter = Character(name: "Luis", status: "Alive", species: "Human", type: "Human", gender: "Man", image: "")
        sut.updateData(data: newCharacter)

        XCTAssertEqual(sut.labelName.text, "Nombre: Luis")
        XCTAssertEqual(sut.labelGender.text, "Género: Man")
        XCTAssertEqual(sut.labelSpecie.text, "Especie: Human")
        XCTAssertEqual(sut.labelStatus.text, "Estado: Alive")
    }
    
    func testOnViewLoadedPresente(){
        sut.dataCharacters = Character(name: "", status: "", species: "", type: "", gender: "", image: "")
        sut.viewDidLoad()
        XCTAssert(presenter.onViewLoadedCalled)
    }
    
    func makeSUT() -> EmployeesDetailViewController{
        let storyboard  = UIStoryboard(name: "EmployeesViper", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "EmployeesDetailViewController") as! EmployeesDetailViewController
        viewController.presenter = presenter
        viewController.loadViewIfNeeded()
        return viewController
    }

}

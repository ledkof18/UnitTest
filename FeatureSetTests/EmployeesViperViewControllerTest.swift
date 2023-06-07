//
//  EmployeesViperViewControllerTest.swift
//  FeatureSetTests
//
//  Created by Luis Enrique Diaz Ramirez on 06/06/23.
//

import XCTest
@testable import FeatureSet

final class EmployeesViperViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersCharacters(){
        let sut = makeSUT()
        sut.updateData(characters: Characters(results: []))
        sut.tableView.reloadData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        sut.updateData(characters: Characters(results: [makeCharacter()]))
        sut.tableView.reloadData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_configuresCell(){
        let sut = makeSUT()
        sut.updateData(characters: Characters(results: [makeCharacter()]))
        sut.tableView.reloadData()
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TwoLinesViewCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.topLabel.text, "Luis")
        XCTAssertEqual(cell?.bottomLabel.text, "Alive")
    }
    
    func makeSUT() -> EmployeesViperViewController{
        let storyboard  = UIStoryboard(name: "EmployeesViper", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "EmployeesViperViewController") as! EmployeesViperViewController
        _ = sut.view
        return sut
    }
    
    func makeCharacter() -> Character{
        return Character(name: "Luis", status: "Alive", species: "", type: "", gender: "", image: "")
    }
    

}

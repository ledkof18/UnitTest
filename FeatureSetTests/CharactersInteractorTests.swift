//
//  EmployeesInteractorTests.swift
//  FeatureSetTests
//
//  Created by Luis Enrique Diaz Ramirez on 11/05/23.
//

import XCTest
@testable import FeatureSet

final class CharactersInteractorTests: XCTestCase {

    var charactersInteractor: EmployeesViperInteractor!
    
    override func setUpWithError() throws {
        charactersInteractor = EmployeesViperInteractor(httpClient: MockHTTPClient())
    }

    override func tearDownWithError() throws {
        charactersInteractor = nil
    }
    
    /**
     Test `Characters`  using closure
     */
    func testFetchCharactersSuccesfully(){
        charactersInteractor.fetchCharacters { characters in
            let firstCharacterName = try? XCTUnwrap(characters.results.first?.name)
            // Prueba unitaria para obtener el numero de elementos `results` usando `Callback`
            XCTAssertEqual(characters.results.count, 20)
            
            XCTAssertEqual(firstCharacterName, "Luis Enrique")
        }
    }

}

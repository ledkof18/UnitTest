//
//  EmployeesViperViewController.swift
//  Apple
//
//  Created by Luis Enrique on 05/10/2023.
//  Copyright © 2023 Luis Enrique. All rights reserved.
//

import Foundation
import UIKit

class EmployeesViperViewController: UIViewController, EmployeesViperViewControllerProtocol {
    var presenter: EmployeesViperPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    var characters: Characters?

    static func viewController() -> EmployeesViperViewController{
        let storyboard  = UIStoryboard(name: "EmployeesViper", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "EmployeesViperViewController") as? EmployeesViperViewController else {
            return EmployeesViperViewController()
        }
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        registerCells()
        presenter?.fetchData()
    }
    
    func registerCells(){
        tableView.register(UINib(nibName: "TwoLinesViewCell", bundle: .main), forCellReuseIdentifier: "TwoLinesViewCell")
    }

}

extension EmployeesViperViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwoLinesViewCell", for: indexPath) as! TwoLinesViewCell
        cell.topLabel.text = characters?.results[indexPath.row].name
        cell.bottomLabel.text = characters?.results[indexPath.row].status
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let character = characters?.results[indexPath.row] else { return }
        EmployeesDetailWireFrame.presentEmployeesDetailModule(fromView: self, character: character)
    }
}

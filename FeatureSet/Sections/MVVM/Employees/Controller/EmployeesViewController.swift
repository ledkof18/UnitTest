//
//  EmployeesViewController.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 25/04/23.
//

import UIKit

class EmployeesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var employeeViewModel: EmployeesViewModel!
    private var dataSource: EmployeeTableViewDataSource<EmployeesViewCell, Character>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employees"
        navigationItem.largeTitleDisplayMode = .never
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.employeeViewModel = EmployeesViewModel(httpClient: ApiService())
        Task{
            try await employeeViewModel.callFuncToGetEmpData()
        }
        
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource(result: self.employeeViewModel.empData.results)
        }
    }
    
    func updateDataSource(result: [Character]){
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeesViewCell", items: result, configureCell: { cell, evm in
            cell.employeeNameLabel.text = evm.gender
            cell.employeeIDLabel.text = evm.name
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}

class EmployeeTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}

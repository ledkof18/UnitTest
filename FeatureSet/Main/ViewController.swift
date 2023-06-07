//
//  ViewController.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 25/04/23.
//

import UIKit

public enum MainMenuOptions: Int {
    case MVVM
    case VIPER
}

extension MainMenuOptions{
    func localizableText() -> String{
        switch self {
        case .MVVM:
            return "MVVM"
        case .VIPER:
            return "Viper"
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var optionArray: [MainMenuOptions] = [.VIPER, .MVVM]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "OPTIONS"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: .main), forCellReuseIdentifier: "MainTableViewCell")
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch optionArray[indexPath.row] {
        case .MVVM:
            let storyboard = UIStoryboard(name: "Employees", bundle: .main)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "EmployeesViewController") as? EmployeesViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case .VIPER:
            EmployeesViperWireFrame.presentEmployeesViperModule(fromView: self)
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.labelTitle.text = optionArray[indexPath.row].localizableText()
        return cell
    }
}


// TODO: Move to a new folder
// Save new value in UserDefaults
struct DataStore{
    static func set<T>(_ value: T, forKey defaultName: String) {
        UserDefaults.standard.set(value, forKey: defaultName)
    }
}

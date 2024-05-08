//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Sameer Verma on 07.05.2024
//  Created by Sameer Verma on 07.05.2024

import UIKit

protocol EmployeeTypeTableViewControllerDelegate: class {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController,
                                           didSelect employeeType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {
    
    var employeeType: EmployeeType?
    weak var delegate: EmployeeTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "type", for: indexPath)
        
        let type = EmployeeType.allCases[indexPath.row]
        cell.textLabel?.text = type.description
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let employeeType = EmployeeType.allCases[indexPath.row]
        self.employeeType = employeeType
        delegate?.employeeTypeTableViewController(self, didSelect: employeeType)
        tableView.reloadData()
    }
}

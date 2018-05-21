//
//  BaseEntityListViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

private let reuseBasicCellIdentifier = "Cell"
private let reuseActionCellIdentifier = "ActionCell"
private let actionCellNormalHeight: CGFloat = 44.0

class BaseEntityListViewController: UITableViewController {

    // MARK: Properties
    var canDeleteRow = false
    var canAddRow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BaseEntityListActionTableViewCell", bundle: nil), forCellReuseIdentifier: reuseActionCellIdentifier)
    }
    
    // MARK: public

    func addNewTableViewRow(animation: UITableViewRowAnimation) {
        let section = canAddRow ? 1 : 0
        let row = max(dataSourceCount()-1, 0)

        let indexPath = IndexPath(row: row, section: section)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: animation)
        tableView.endUpdates()
    }
    
    func addButtonAction() {
        // in subclases
    }
    
    func deleteCellWithIndex(_ index: IndexPath) {
        // in subclases
    }
    
    func dataSourceCount() -> Int {
        // in subclases
        return 0
    }
    
    func handleTableView(cell: UITableViewCell, indexPath: IndexPath) {
        // in subclases
    }
    
    // MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        if canAddRow {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if canAddRow && section == 0 {
            return 1
        } else {
            return dataSourceCount()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if canAddRow && indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: reuseActionCellIdentifier) as? BaseEntityListActionTableViewCell {
                cell.actionTitle = NSLocalizedString("NewStringActionCellTitle", comment: "")
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: reuseBasicCellIdentifier) {
                handleTableView(cell: cell, indexPath: indexPath)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate methods
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var actions = [UITableViewRowAction]()
        if canDeleteRow {
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
                self.deleteCellWithIndex(indexPath)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            actions.append(deleteAction)
        }
        
        return actions
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if canAddRow && indexPath.section == 0 {
            addButtonAction()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if canAddRow && indexPath.section == 0 {
            return actionCellNormalHeight
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}

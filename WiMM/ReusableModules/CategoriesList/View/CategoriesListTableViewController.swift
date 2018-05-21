//
//  CategoriesListViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class CategoriesListTableViewController: BaseEntityListViewController, StoryboardLoadable {

    // MARK: Properties
    private var dataSource = [CategoryModel]()
    private var newCategoryAction: UIAlertAction?
    
    var presenter: CategoriesListPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        canAddRow = true
        canDeleteRow = true
        
        super.viewDidLoad()
        
        title = NSLocalizedString("CategoriesListTitle", comment: "")
        presenter?.prepareDataSource()
    }
    
    // MARK: override
    
    override func addButtonAction() {
        let alert = UIAlertController(title: NSLocalizedString("CategoryCreationAlertTitle", comment: ""), message: NSLocalizedString("CategoryCreationAlertDescription", comment: ""), preferredStyle: .alert)
        alert.addTextField { [weak self = self] (textField) in
            textField.placeholder = NSLocalizedString("Name", comment: "")
            textField.addTarget(self, action: #selector(self?.newCategoryActionTextChanged(_:)), for: .editingChanged)
        }
        let doneAction = UIAlertAction(title: NSLocalizedString("DoneButtonTitle", comment: ""), style: .default, handler: { [weak self = self] (alertAction) in
            let textField = alert.textFields![0] as UITextField
            if let text = textField.text {
                self?.presenter?.addNewCategory(name: text)
            }
        })
        newCategoryAction = doneAction
        doneAction.isEnabled = false

        alert.addAction(doneAction)
        alert.addAction(UIAlertAction(title: NSLocalizedString("CloseButtonTitle", comment: ""), style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func deleteCellWithIndex(_ index: IndexPath) {
        
    }
    
    override func dataSourceCount() -> Int {
        return dataSource.count
    }
    
    override func handleTableView(cell: UITableViewCell, indexPath: IndexPath) {
        let element = dataSource[indexPath.row]
        
        cell.textLabel?.text = element.name
    }
    
    // MARK: Private
    
    @objc func newCategoryActionTextChanged(_ sender:UITextField) {
        if let count = sender.text?.count {
            newCategoryAction?.isEnabled = (count > 0)
        }
    }
}

extension CategoriesListTableViewController: CategoriesListView {
    
    func updateViewWith(dataSource: [CategoryModel]) {
        self.dataSource = dataSource
        tableView.reloadData()
    }
    
    func addNewCategory(category: CategoryModel) {
        dataSource.append(category)
        addNewTableViewRow(animation: .automatic)
    }
    
    func showError(description: String) {
        let alert = UIAlertController(title: NSLocalizedString("CategoryCreationAlertTitle", comment: ""), message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("CloseButtonTitle", comment: ""), style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

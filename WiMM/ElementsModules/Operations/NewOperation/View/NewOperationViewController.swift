//
//  NewOperationTableViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/23/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class NewOperationTableViewController: BaseNewEntityTableViewController, StoryboardLoadable {

    // MARK: Properties
    var operationModel: NewOperationModel?
    
    var presenter: NewOperationPresentation?
    
    private var showCathegoryPickerView = false
    private var showDatePickerView = false

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleAutomaticTableViewRowHeight()
        registerSelectableCell()
        registerPickerViewCell()
        registerDataPickerViewCell()
        registerDescriptionViewCell()
        
        handleOperationModel()
    }
    
    // MARK: private
    
    private func handleOperationModel() {
        var backgroundColor = UIColor.green
        if let operationType = operationModel?.operationType {
            switch operationType {
            case .positive:
                backgroundColor = UIColor.green
            case .transfer:
                backgroundColor = UIColor.yellow
            case .borrow:
                backgroundColor = UIColor.orange
            case .negative:
                backgroundColor = UIColor.red
            }
        }
        
        view.backgroundColor = backgroundColor
    }
    
    // MARK: table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
           return  2
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell()
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: baseNewEntitySelectableCellKey) as? BaseNewSelectableTableViewCell else {
                    return emptyCell
                }
                
                if let categoryName = operationModel?.operationCategory?.name {
                    cell.selectableTextLabel.text = categoryName
                }
                
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: baseNewEntityPickerViewValueCellKey) as? BaseNewPickerViewTableViewCell else {
                    return emptyCell
                }
                
                cell.dataSource = ["first", "second", "third"]
                cell.delegate = self
                return cell
                
            default:
                return emptyCell
            }
        case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: baseNewEntitySelectableCellKey) as? BaseNewSelectableTableViewCell else {
                    return emptyCell
                }
                
                cell.selectableTextLabel.text = "Date"
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: baseNewEntityPickerViewDateCellKey) as? BaseNewDatePickerViewTableViewCell else {
                    return emptyCell
                }
                
                return cell
                
            default:
                return emptyCell
            }
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: baseNewEntityDescriptionCellKey) as? BaseNewDescriptionTableViewCell else {
                return emptyCell
            }
            
            cell.delegate = self
            
            return cell
        default:
            return emptyCell
        }
    }
    
    // MARK: table view delegate
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch section {
        case 0:
            title = "Category"
        case 1:
            title = "Operation date"
        case 2:
            title = "Description"
        default:
            title = ""
        }
        return title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            showCathegoryPickerView = !showCathegoryPickerView
            tableView.beginUpdates()
            tableView.endUpdates()
        } else if indexPath.section == 1 && indexPath.row == 0 {
            showDatePickerView = !showDatePickerView
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight: CGFloat = 44.0
        if indexPath.section == 0 && indexPath.row == 1 {
            rowHeight = showCathegoryPickerView ? 100 : 0
        } else if indexPath.section == 1 && indexPath.row == 1 {
            rowHeight = showDatePickerView ? 100 : 0
        } else if indexPath.section == 2 {
            rowHeight = super.tableView(tableView, heightForRowAt: indexPath)
        }
        return rowHeight
    }
}

extension NewOperationTableViewController: NewOperationView {

}

extension NewOperationTableViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        operationModel?.operationDescription = textView.text
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension NewOperationTableViewController: BaseNewPickerViewTableViewCellDelegate {
    
    func didSelectValueWithRow(_ row: Int) {
        
    }
}

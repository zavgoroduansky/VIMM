//
//  BaseNewEntityViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class BaseNewEntityTableViewController: UITableViewController {

    // MARK: Properties
    let baseNewEntitySelectableCellKey = "SelectableCell"
    let baseNewEntityPickerViewValueCellKey = "PickerViewValueCell"
    let baseNewEntityPickerViewDateCellKey = "PickerViewDateCell"
    let baseNewEntityDescriptionCellKey = "DescriptionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleAutomaticTableViewRowHeight() {
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func registerSelectableCell() {
        tableView.register(UINib(nibName: "BaseNewSelectableTableViewCell", bundle: nil), forCellReuseIdentifier: baseNewEntitySelectableCellKey)
    }
    
    func registerPickerViewCell() {
        tableView.register(UINib(nibName: "BaseNewPickerViewTableViewCell", bundle: nil), forCellReuseIdentifier: baseNewEntityPickerViewValueCellKey)
    }
    
    func registerDataPickerViewCell() {
        tableView.register(UINib(nibName: "BaseNewDatePickerViewTableViewCell", bundle: nil), forCellReuseIdentifier: baseNewEntityPickerViewDateCellKey)
    }
    
    func registerDescriptionViewCell() {
        tableView.register(UINib(nibName: "BaseNewDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: baseNewEntityDescriptionCellKey)
    }
}

//
//  OperationsViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "OperationsCell"

class OperationsViewController: UIViewController, StoryboardLoadable, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    private var dataSource = [OperationsTableCellModel]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: OperationsTablePresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleTableReloadingEffects(isActive: true)
    }
    
    // MARK: private
    
    private func handleTableReloadingEffects(isActive: Bool) {
        DispatchQueue.main.async {
            [unowned self] in
            self.loadingView.isHidden = !isActive
            if isActive {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OperationsTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OperationsTableViewCell
        
        let item = dataSource[indexPath.row]
        cell.operationImageView.image = nil
        cell.operationDescriptionLabel.text = item.operationDescription
        cell.operationAmountLabel.text = item.amount
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(operation: dataSource[indexPath.row])
        
    }
}

extension OperationsViewController: OperationsTableView {
    
    func updateViewWithData(_ dataSource: [OperationsTableCellModel], forceReload: Bool) {
        DispatchQueue.main.async {
            [unowned self] in
            if forceReload {
                self.dataSource = dataSource
                self.tableView.reloadData()
            } else {
                self.dataSource.append(contentsOf: dataSource)
                self.tableView.reloadData() // need to insert elements in table view
            }
            self.handleTableReloadingEffects(isActive: false)
        }
    }
    
    func startActivityIndicator() {
        self.handleTableReloadingEffects(isActive: true)
    }
}

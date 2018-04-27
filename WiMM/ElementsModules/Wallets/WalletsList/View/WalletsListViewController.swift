//
//  WalletsListViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

class WalletsListViewController: BaseEntityListViewController, StoryboardLoadable, UITableViewDataSource {

    // MARK: Properties
    private var dataSource = [WalletModel]()
    
    var presenter: WalletsListPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("WalletsCellName", comment: "")
        presenter?.prepareDataSource()
    }
    
    // MARK: Actions
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.showNewWalletModule()
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            let element = dataSource[indexPath.row]
            
            cell.textLabel?.text = element.name
            cell.detailTextLabel?.text = element.currency?.shortName
            
            return cell
        }
        return UITableViewCell()
    }
}

extension WalletsListViewController: WalletsListView {
    
    func updateViewWith(dataSource: [WalletModel]) {
        hideLoadingElements()
        
        self.dataSource = dataSource
        canDeleteRow = true
        tableView.reloadData()
    }
}

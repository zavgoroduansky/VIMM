//
//  WalletsListTableViewController
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class WalletsListTableViewController: BaseEntityListViewController, StoryboardLoadable {

    // MARK: Properties
    private var dataSource = [WalletModel]()
    
    var presenter: WalletsListPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        canAddRow = true

        super.viewDidLoad()
        
        title = NSLocalizedString("WalletsCellName", comment: "")
        presenter?.prepareDataSource()
    }
    
    // MARK: override
    
    override func addButtonAction() {
        presenter?.showNewWalletModule()
    }
    
    override func deleteCellWithIndex(_ index: IndexPath) {
        
    }
    
    override func dataSourceCount() -> Int {
        return dataSource.count
    }
    
    override func handleTableView(cell: UITableViewCell, indexPath: IndexPath) {
        let element = dataSource[indexPath.row]
        
        cell.textLabel?.text = element.name
        cell.detailTextLabel?.text = element.currency?.shortName
    }
}

extension WalletsListTableViewController: WalletsListView {
    
    func updateViewWith(dataSource: [WalletModel]) {
        self.dataSource = dataSource
        canDeleteRow = true
        tableView.reloadData()
    }
}

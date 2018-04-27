//
//  SettingsViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/2/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

private let basicCellIndetifier = "Cell"

class SettingsViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!

    private var dataSource = [SettingsModel]()
    var presenter: SettingsPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.prepareDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        parent?.title = NSLocalizedString("SettingsTitle", comment: "")
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: basicCellIndetifier) {
            let element = dataSource[indexPath.row]
            
            if let imageName = element.image {
                cell.imageView?.image = UIImage(named: imageName)
            }
            cell.textLabel?.text = element.text
            cell.detailTextLabel?.text = element.descriptionText
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element = dataSource[indexPath.row]
        switch(element.key) {
        case .wallets:
            presenter?.showWalletsList()
        case .currencies:
            presenter?.showCurrenciesList()
        }
    }
}

extension SettingsViewController: SettingsView {
    
    func updateViewWithData(_ data: [SettingsModel]) {
        dataSource = data
        tableView.reloadData()
    }
}

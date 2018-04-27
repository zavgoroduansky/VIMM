//
//  BaseEntityListViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class BaseEntityListViewController: UIViewController, UITableViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var canDeleteRow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLoadingElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: public
    
    func showLoadingElements() {
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoadingElements() {
        loadingView.isHidden = true
        activityIndicator.stopAnimating()
    }

    func deleteCellWithIndex(_ index: IndexPath) {
        // in subclases
    }
    
    // MARK: UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
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
    
}

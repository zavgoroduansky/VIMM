//
//  WalletsCollectionViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "WalletCell"

class WalletsCollectionViewController: UICollectionViewController, StoryboardLoadable {

    // MARK: Properties
    
    var presenter: WalletsCollectionPresentation?
    
    private var dataSource = [WalletModel]()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        
        presenter?.prepareDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WalletsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WalletsCollectionViewCell
        
        let item = dataSource[indexPath.row]
        cell.titleLabel.text = item.name
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(wallet: dataSource[indexPath.row])
    }
}

extension WalletsCollectionViewController: WalletsCollectionView {
    
    func updateViewWithData(_ dataSource: [WalletModel]) {
        self.dataSource = dataSource
        DispatchQueue.main.async {
            [unowned self] in
            self.collectionView?.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}

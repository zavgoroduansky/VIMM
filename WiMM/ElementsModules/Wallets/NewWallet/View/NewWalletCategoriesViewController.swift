//
//  NewWalletCategoriesViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class NewWalletCategoriesViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var categoriesContainer: UIView!
    
    var presenter: NewWalletPresentation?
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.createCategoriesViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NewWalletCategoriesViewController: NewWalletCategoriesDelegate {
    
    func nextButtonPressed() {
        print("hello")
    }
    
    func categoriesViewControllerWasCreated(viewController: UIViewController) {
        add(viewController: viewController, to: categoriesContainer)
    }
    
    func controllerIndex() -> Int {
        return index
    }
}

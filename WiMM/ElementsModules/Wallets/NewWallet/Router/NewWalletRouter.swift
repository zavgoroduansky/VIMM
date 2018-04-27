//
//  NewWalletRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class NewWalletRouter {

    // MARK: Properties
    var childControllers = [UIViewController]()
    
    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> NewWalletViewController {
        let viewController = UIStoryboard.loadViewController() as NewWalletViewController
        let presenter = NewWalletPresenter()
        let router = NewWalletRouter()
        let interactor = NewWalletInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter
        
        // children controllers
        let newWalletNameController = UIStoryboard(name: "NewWallet", bundle: nil).instantiateViewController(withIdentifier: "NewWalletNameViewController") as! NewWalletNameViewController
        newWalletNameController.presenter = presenter
        presenter.nameView = newWalletNameController
        router.childControllers.append(newWalletNameController)
        
        let newWalletCurrencyController = UIStoryboard(name: "NewWallet", bundle: nil).instantiateViewController(withIdentifier: "NewWalletCurrencyViewController") as! NewWalletCurrencyViewController
        newWalletCurrencyController.presenter = presenter
        presenter.currencyView = newWalletCurrencyController
        router.childControllers.append(newWalletCurrencyController)
        
        let newWalletCategoriesController = UIStoryboard(name: "NewWallet", bundle: nil).instantiateViewController(withIdentifier: "NewWalletCategoriesViewController") as! NewWalletCategoriesViewController
        newWalletCategoriesController.presenter = presenter
        presenter.categoryView = newWalletCategoriesController
        router.childControllers.append(newWalletCategoriesController)
        
        return viewController
    }
}

extension NewWalletRouter: NewWalletWireframe {

    func subViewControllers() -> [UIViewController] {
        return childControllers
    }
}

//
//  CategoriesListRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class CategoriesListRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(wallet: WalletModel, delegate: CategoriesListDelegate?) -> CategoriesListTableViewController {
        let viewController = UIStoryboard.loadViewController() as CategoriesListTableViewController
        let presenter = CategoriesListPresenter(wallet: wallet)
        let router = CategoriesListRouter()
        let interactor = CategoriesListInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.delegate = delegate

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension CategoriesListRouter: CategoriesListWireframe {
    // TODO: Implement wireframe methods
}

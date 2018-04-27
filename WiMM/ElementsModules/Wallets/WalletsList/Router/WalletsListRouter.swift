//
//  WalletsListRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class WalletsListRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> WalletsListViewController {
        let viewController = UIStoryboard.loadViewController() as WalletsListViewController
        let presenter = WalletsListPresenter()
        let router = WalletsListRouter()
        let interactor = WalletsListInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension WalletsListRouter: WalletsListWireframe {
    
    func showNewWalletModule() {
        let newWalletController = NewWalletRouter.setupModule()
        view?.navigationController?.pushViewController(newWalletController, animated: true)
    }
}

//
//  SettingsRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/2/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class SettingsRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> SettingsViewController {
        let viewController = UIStoryboard.loadViewController() as SettingsViewController
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        let interactor = SettingsInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension SettingsRouter: SettingsWireframe {
    
    func showWalletsList() {
        let walletsListViewController = WalletsListRouter.setupModule()
        view?.navigationController?.pushViewController(walletsListViewController, animated: true)
    }
}

//
//  WalletsCollectionRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class WalletsCollectionRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(delegate: WalletCollectionDelegate?) -> WalletsCollectionViewController {
        let viewController = UIStoryboard.loadViewController() as WalletsCollectionViewController
        let presenter = WalletsCollectionPresenter()
        let router = WalletsCollectionRouter()
        let interactor = WalletsCollectionInteractor()

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

extension WalletsCollectionRouter: WalletsCollectionWireframe {
    // TODO: Implement wireframe methods
}

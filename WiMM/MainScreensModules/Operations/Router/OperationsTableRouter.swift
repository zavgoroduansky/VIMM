//
//  OperationsTableRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class OperationsTableRouter {

    // MARK: Properties

    weak var view: UIViewController?
    weak var presenter: OperationTablePresenterInput?

    // MARK: Static methods

    static func setupModule(delegate: OperationsTableDelegate?) -> (viewController: OperationsViewController, input: OperationTableInput) {
        let viewController = UIStoryboard.loadViewController() as OperationsViewController
        let presenter = OperationsTablePresenter()
        let router = OperationsTableRouter()
        let interactor = OperationsTableInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.delegate = delegate

        router.view = viewController
        router.presenter = presenter

        interactor.output = presenter

        return (viewController, router)
    }
}

extension OperationsTableRouter: OperationsTableWireframe {
    
}

extension OperationsTableRouter: OperationTableInput {
    
    func reloadDataWith(wallet: WalletModel) {
        presenter?.reloadDataWith(wallet: wallet)
    }
}

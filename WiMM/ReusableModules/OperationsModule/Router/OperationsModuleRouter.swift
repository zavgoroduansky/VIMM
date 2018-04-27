//
//  OperationsModuleRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class OperationsModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> OperationsModuleViewController {
        let viewController = UIStoryboard.loadViewController() as OperationsModuleViewController
        let presenter = OperationsModulePresenter()
        let router = OperationsModuleRouter()
        let interactor = OperationsModuleInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension OperationsModuleRouter: OperationsModuleWireframe {
    // TODO: Implement wireframe methods
}

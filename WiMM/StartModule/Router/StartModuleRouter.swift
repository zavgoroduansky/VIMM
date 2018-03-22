//
//  StartModuleRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class StartModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> StartModuleViewController {
        let viewController = UIStoryboard.loadViewController() as StartModuleViewController
        let presenter = StartModulePresenter()
        let router = StartModuleRouter()
        let interactor = StartModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension StartModuleRouter: StartModuleWireframe {
    // TODO: Implement wireframe methods
}

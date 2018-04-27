//
//  NewOperationRouter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/23/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class NewOperationRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(operationModel: NewOperationModel) -> NewOperationTableViewController {
        let viewController = UIStoryboard.loadViewController() as NewOperationTableViewController
        let presenter = NewOperationPresenter()
        let router = NewOperationRouter()
        let interactor = NewOperationInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter
        
        viewController.operationModel = operationModel

        return viewController
    }
}

extension NewOperationRouter: NewOperationWireframe {
    // TODO: Implement wireframe methods
}

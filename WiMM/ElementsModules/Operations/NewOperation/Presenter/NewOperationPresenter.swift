//
//  NewOperationPresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/23/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class NewOperationPresenter {

    // MARK: Properties

    weak var view: NewOperationView?
    var router: NewOperationWireframe?
    var interactor: NewOperationUseCase?
}

extension NewOperationPresenter: NewOperationPresentation {
    // TODO: implement presentation methods
}

extension NewOperationPresenter: NewOperationInteractorOutput {
    // TODO: implement interactor output methods
}

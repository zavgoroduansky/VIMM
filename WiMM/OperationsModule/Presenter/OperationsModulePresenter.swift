//
//  OperationsModulePresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class OperationsModulePresenter {

    // MARK: Properties

    weak var view: OperationsModuleView?
    var router: OperationsModuleWireframe?
    var interactor: OperationsModuleUseCase?
}

extension OperationsModulePresenter: OperationsModulePresentation {
    // TODO: implement presentation methods
}

extension OperationsModulePresenter: OperationsModuleInteractorOutput {
    // TODO: implement interactor output methods
}

//
//  StartModulePresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class StartModulePresenter {

    // MARK: Properties

    weak var view: StartModuleView?
    var router: StartModuleWireframe?
    var interactor: StartModuleUseCase?
}

extension StartModulePresenter: StartModulePresentation {
    // TODO: implement presentation methods
}

extension StartModulePresenter: StartModuleInteractorOutput {
    // TODO: implement interactor output methods
}

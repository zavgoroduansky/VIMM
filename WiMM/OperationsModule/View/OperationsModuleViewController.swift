//
//  OperationsModuleViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class OperationsModuleViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: OperationsModulePresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OperationsModuleViewController: OperationsModuleView {
    // TODO: implement view output methods
}

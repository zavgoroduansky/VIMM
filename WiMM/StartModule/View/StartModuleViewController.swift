//
//  StartModuleViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class StartModuleViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: StartModulePresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StartModuleViewController: StartModuleView {
    // TODO: implement view output methods
}

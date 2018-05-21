//
//  Constants.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/12/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Currency {
        static let usdCode = 840
    }
    struct Wallet {
        static let defaultWalletName = "Cash"
    }
    struct Category {
        static let defaultCategoryName = "Purchase"
    }
    struct Fonts {
        static let infoText = UIFont.systemFont(ofSize: 15.0)
        static let selectedText = UIFont.boldSystemFont(ofSize: 16.0)
    }
    struct Colors {
        static let infoText = UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
    }
}

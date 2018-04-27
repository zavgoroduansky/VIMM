//
//  OperationsTableCellModel.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

enum OperationsType {
    case positive
    case transfer
    case negative
}

struct OperationsTableCellModel {
    
    var operationId: Int
    var operationDate: Date
    var operationType: OperationsType
    var operationDescription: String
    var amount: String
    
}

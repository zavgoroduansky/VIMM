//
//  NewOperationModel.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/23/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

enum NewOperationDate {
    case currentDate(Bool)
    case date(Date)
}

enum NewOperationType {
    case positive
    case transfer
    case borrow
    case negative
}

struct NewOperationModel {
    
    var id: Any?
    var operationType: NewOperationType?
    var operationWallet: WalletModel?
    var operationCategory: CategoryModel?
    var operationDate: NewOperationDate?
    var operationAmount: Double?
    var operationDescription: String?
    var operationReceiverContact: String?
    var operationReceiverWallet: WalletModel?
    var operationReceiverAmount: Double?
    
    init(id: Any? = nil,
         operationType: NewOperationType? = nil,
         operationWallet: WalletModel? = nil,
         operationCategory: CategoryModel? = nil,
         operationAmount: Double? = nil,
         operationDescription: String? = nil,
         operationReceiverContact: String? = nil,
         operationReceiverWallet: WalletModel? = nil,
         operationReceiverAmount: Double? = nil) {

        self.id = id
        self.operationType = operationType
        self.operationWallet = operationWallet
        self.operationCategory = operationCategory
        self.operationDate = .currentDate(true)
        self.operationAmount = operationAmount
        self.operationDescription = operationDescription
        self.operationReceiverContact = operationReceiverContact
        self.operationReceiverWallet = operationReceiverWallet
        self.operationReceiverAmount = operationReceiverAmount
    }
}

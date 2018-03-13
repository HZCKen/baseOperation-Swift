//
//  HZCOperationGroup.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/1.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCOperationGroup {
    lazy var items = [HZCOperationItem]()
    var header:String?
    var footer:String?

    convenience init(items:[HZCOperationItem]) {
        self.init()
        self.items = items
    }
}

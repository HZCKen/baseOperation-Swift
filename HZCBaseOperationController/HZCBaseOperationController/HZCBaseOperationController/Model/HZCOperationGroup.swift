//
//  HZCOperationGroup.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/1.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCOperationGroup: NSObject {
    var items:[HZCOperationItem]
    var header:String?
    var footer:String?
    
    fileprivate override init() {
        items = []
        super.init()
    }
    
    convenience init(items:[HZCOperationItem]) {
        self.init()
        self.items = items
    }
    
   class func operationGroupWithItems(items:[HZCOperationItem]) -> HZCOperationGroup {
        let group = HZCOperationGroup()
        group.items = items
        return group
    }
    
}

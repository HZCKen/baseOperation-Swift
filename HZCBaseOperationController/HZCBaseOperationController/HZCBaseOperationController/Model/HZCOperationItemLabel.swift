//
//  HZCOperationItemLabel.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCOperationItemLabel: HZCOperationItem {
    var text:String?
    
    convenience init(title:String?,icon:String?,text:String?,operation:(()->Void)?) {
        self.init(title: title, icon: icon, operation: operation)
        self.text = text
    }
    
   convenience init(title:String?,text:String?,operation:(()->Void)?) {
    self.init(title: title, icon: nil, text:text ,operation: operation)
    }
}

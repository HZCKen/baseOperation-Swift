//
//  HZCOperationItemArrow.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCOperationItemArrow: HZCOperationItem {
    
    convenience init(title:String? , icon:String? , targetVCName:String?) {
        self.init()
        self.title = title
        self.icon = icon
        self.targetVCName = targetVCName
    }
    
    convenience init(title:String? , targetVCName:String?) {
        self.init(title: title, icon: nil, targetVCName: targetVCName)
    }
}

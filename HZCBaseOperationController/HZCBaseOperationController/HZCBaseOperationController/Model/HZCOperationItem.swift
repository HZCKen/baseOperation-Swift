//
//  HZCOperationItem.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/1.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

protocol ViewControllerType {
     func controller() -> UIViewController
}

class HZCOperationItem: NSObject {
    
    var title:String?
    var icon:String?
    var subTitle:String?
    var isNeedUpgrade:Bool = false
    var isMiddleText:Bool = false
    var operation :(() -> Void)?
    
    convenience init(title:String? , icon : String?) {
        self.init()
        self.title = title
        self.icon = icon
    }

    convenience init(title:String? ,icon:String?,operation:(()->Void)?) {
        self.init(title: title, icon: icon)
        self.operation = operation
    }
    
    convenience init(title:String? , operation:(()->Void)?) {
        self.init(title: title, icon: nil, operation: operation)
    }
}


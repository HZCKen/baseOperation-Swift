//
//  HZCOperationItemSwitch.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/6.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCOperationItemSwitch: HZCOperationItem {
    var isOn :Bool?
    var switchChangeVale:((Bool)->Void)?
    
    convenience init(title:String? ,icon:String? ,switchChangeVale:@escaping ((Bool)->Void)){
        
        self.init(title: title, icon: icon)
        self.switchChangeVale = switchChangeVale
    }
    
    convenience init(title:String? ,switchChangeVale:@escaping ((Bool)->Void)) {
        self.init(title: title, icon: nil, switchChangeVale: switchChangeVale)
    }
}

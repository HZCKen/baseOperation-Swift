//
//  HZCTestViewController.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/6.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCTestViewController: HZCBaseOperationController {

    deinit {
        print("\(self.self) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = HZCOperationItem()
        item1.title = "1"
        item1.subTitle = "subtitle1"
        let item2 = HZCOperationItem()
        item2.title = "2"
//        let item3 = HZCOperationItemArrow(title: "3", icon: nil)
//        item3.operation = { [weak item3] ()->Void in
//            print(item3?.title ?? "")
//        }
        
        let item4 = HZCOperationItem(title: "4", operation: ( {()->Void  in
            print(4)
        }))
        
        let item5 = HZCOperationItemLabel(title: "5", text: "label") {
            print(5)
        }
        item5.isNeedUpgrade = true
 
        let item7 = HZCOperationItemSwitch(title: "7", icon: "") { [weak self] (isON) in
            print(isON)
            let test = HZCTestViewController()
            self?.navigationController?.pushViewController(test, animated: true)
        }
        
        item7.isOn = true
        
        let group1 = HZCOperationGroup.operationGroupWithItems(items: [item1,item2,item4,item5,item7])
        operationGroup.append(group1)
        
        group1.header = "group1"
        group1.footer = "group1"
        //        tableView.reloadData()
        let item8 = HZCOperationItem(title: "8") {
            
        }
        item8.isMiddleText = true
        let group2 = HZCOperationGroup(items: [item8])
        group2.header = "group2"
        operationGroup.append(group2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



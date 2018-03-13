//
//  HZCBaseOperationController.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/1.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCBaseOperationController: UIViewController{

    lazy var tableView = { () -> UITableView in
        
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        self.view.addSubview(tableView)
        return tableView
    }()
    
    lazy var operationGroup = [HZCOperationGroup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupTableView()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension HZCBaseOperationController  {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HZCOperationCell.self, forCellReuseIdentifier: HZCOperationCell.cellIdentifer())
        tableView.separatorStyle = .none
    }
}
// MARK: - UITableViewDataSource
extension HZCBaseOperationController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return operationGroup.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = operationGroup[section]
        return group.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HZCOperationCell = tableView.dequeueReusableCell(withIdentifier: HZCOperationCell.cellIdentifer(), for: indexPath) as! HZCOperationCell
        let group = operationGroup[indexPath.section]
        let item = group.items[indexPath.row]
        cell.item = item
        
        cell.isFirstCell = indexPath.row == 0
        cell.isLastCell = indexPath.row == (group.items.count - 1)
        
        return cell
    }
}
// MARK: - UITableViewDelegate
extension HZCBaseOperationController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let group = operationGroup[indexPath.section]
        let item = group.items[indexPath.row]
        if let operation = item.operation {
            operation()
            return
        }
        
        guard let targetVCName = item.targetVCName  else {
            print("没有设置类名")
            return
        }
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + targetVCName)
        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return
        }
        let targetVC = clsType.init()
        navigationController?.pushViewController(targetVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let group = operationGroup[section]
        if let footer = group.footer , footer.count > 0 {
            let label = UILabel()
            label.text = footer
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor.lightGray
            return label
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let group = operationGroup[section]
        if let footer = group.footer , footer.count > 0 {
            return 32
        } else {
            return 23
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let group = operationGroup[section]
        if let header = group.header , header.count > 0 {
            let label = UILabel()
            label.text = header
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor.lightGray
            return label
        } else {
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let group = operationGroup[section]
        if let header = group.header , header.count > 0 {
            return 32
        } else {
            if section == 0 {
                return 24
            } else {
                return 1
            }
        }
    }
    
}

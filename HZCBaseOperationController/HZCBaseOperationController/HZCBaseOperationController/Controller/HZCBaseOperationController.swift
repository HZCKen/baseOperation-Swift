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
    
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let group = operationGroup[section]
        if let footer = group.footer , footer.count > 0 {
            let label = UILabel()
            label.text = footer
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.lightGray
            return label
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let group = operationGroup[section]
        if let footer = group.footer , footer.count > 0 {
            return 24
        } else {
            if section == 0 {
                return 16
            } else {
                return 1
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let group = operationGroup[section]
        if let header = group.header , header.count > 0 {
            let label = UILabel()
            label.text = header
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.lightGray
            return label
        } else {
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let group = operationGroup[section]
        if let header = group.header , header.count > 0 {
            return 24
        } else {
            if section == 0 {
                return 16
            } else {
                return 1
            }
        }
    }
    
}

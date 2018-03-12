//
//  HZCOperationCell.swift
//  HZCBaseOperationController
//
//  Created by Apple on 2018/3/1.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

import UIKit

class HZCOperationCell: UITableViewCell {
    
    var isFirstCell:Bool?
    var isLastCell:Bool?
    
    var item:HZCOperationItem {
        didSet {
            imageView?.image = UIImage(named: item.icon ?? "")
            detailTextLabel?.text = item.subTitle
            upgradeImagView.isHidden = !item.isNeedUpgrade
            if item.isMiddleText {
                minddleLabel.isHidden = false
                minddleLabel.text = item.title
                textLabel?.text = ""
                label.text = ""
                detailTextLabel?.text = ""
            } else {
                textLabel?.text = item.title
                minddleLabel.isHidden = true
            }
            setupAccessoryView()
        }
    }
    
   private lazy var topLineView:UIView = {
        let topLineView = UIView()
        topLineView.backgroundColor = UIColor.black
        topLineView.alpha = 0.1
        return topLineView
    }()
    
    private lazy var buttomLineView:UIView = {
        let buttomLineView = UIView()
        buttomLineView.backgroundColor = UIColor.black
        buttomLineView.alpha = 0.1
        return buttomLineView
    }()
    
    private lazy var upgradeImagView:UIImageView = {
       let upgaradeImageView = UIImageView()
        upgaradeImageView.image = UIImage(named: "upgrade@2x.png")
        return upgaradeImageView
    }()
    
    private lazy var minddleLabel:UILabel = {
       let minddelLabel = UILabel()
        minddelLabel.font = UIFont.systemFont(ofSize: 14)
        minddelLabel.textColor = UIColor.red
        minddelLabel.textAlignment = .center
        return minddelLabel
    }()
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private lazy var switchView:UISwitch = {
        let switchView = UISwitch()
        switchView.addTarget(self, action: #selector(didSwitchValueChange), for: UIControlEvents.touchUpInside)
        return switchView
    }()



    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        item = HZCOperationItem()
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(topLineView)
        contentView.addSubview(buttomLineView)
        contentView.addSubview(upgradeImagView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cellIdentifer() -> String {
        return "HZCOperationCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLineFrame()
        setupUpgardeImageViewFrame()
        setupMiddleLabelFrame()
    }
    
    private func setupMiddleLabelFrame() {
        if item.isMiddleText {
            minddleLabel.center = contentView.center
            minddleLabel.sizeToFit()
        } else {
            minddleLabel.frame = CGRect.zero
        }
    }
    
    private func setupLineFrame() {
        var lineX:CGFloat
        if let icon = item.icon, icon.count > 0 {
            lineX = (imageView?.frame.origin.x)!
        } else {
            lineX = (textLabel?.frame.origin.x)!
        }
        
        let toppLineY = 0.0
        let buttomLineY = frame.size.height - 1
        let lineW = frame.size.width
        let lineH = 1.0
        
        if isFirstCell! {
            topLineView.frame = CGRect(x: 0.0, y: toppLineY, width: Double(lineW), height: lineH)
        } else {
            topLineView.frame = CGRect.zero
        }
        
        if isLastCell! {
            buttomLineView.frame = CGRect(x: 0.0, y: Double(buttomLineY), width: Double(lineW), height: lineH)
        } else {
            buttomLineView.frame = CGRect(x: lineX, y: buttomLineY, width: lineW, height: CGFloat(lineH))
        }
    }
    
    private func setupUpgardeImageViewFrame() {
        if item.isNeedUpgrade {
            let x = (textLabel?.frame.maxX ?? 0) + 4.0
            let y = textLabel?.frame.origin.y ?? 0
            let width = 45.0 as CGFloat
            let height = 21.0 as CGFloat
            upgradeImagView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            upgradeImagView.frame = CGRect.zero
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension HZCOperationCell {
    func setupAccessoryView(){
        if item is HZCOperationItemArrow {
            accessoryType = .disclosureIndicator
        } else if item is HZCOperationItemLabel {
            let labelItem:HZCOperationItemLabel = item as! HZCOperationItemLabel
            label.text = labelItem.text
            label.sizeToFit()
            accessoryView = label
        } else if item is HZCOperationItemSwitch {
            let switchItem = item as!HZCOperationItemSwitch
            switchView.isOn = switchItem.isOn ?? false
            accessoryView = switchView
        } else {
            accessoryType = .none
            accessoryView = nil
        }
    }
    
  
}

extension HZCOperationCell {
   @objc func didSwitchValueChange() {
        let switchItem = item as! HZCOperationItemSwitch
        switchItem.isOn = switchView.isOn
        if let switchChangeVale = switchItem.switchChangeVale {
            switchChangeVale(switchView.isOn)
        }
    }
}


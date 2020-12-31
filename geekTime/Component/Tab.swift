//
//  Tab.swift
//  geekTime
//
//  Created by zhj on 2019/11/23.
//  Copyright © 2019 geekbang. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class Tab: UIView {
    var items: [String]
    var itemButtons: [UIButton]
    var selectedItemButton: UIButton!
    
    //指示器
    var indicatorView: UIView!
    
    //选中的颜色
    var selectedColor: UIColor? {
        didSet {
            if let color = self.selectedColor {
                self.indicatorView.backgroundColor = color
                itemButtons.forEach { (button) in
                    button.setTitleColor(color, for: .selected)
                }
            } else {
                self.indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
                itemButtons.forEach { (button) in
                    button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
                }
            }
            
        }
    }
    //一般颜色
    var normalColor: UIColor?
    
    init?(items: [String]) {
        if items.count == 0 {
            return nil
        }
        self.items = items
        itemButtons = []
        super.init(frame: .zero)
        self.createViews()
    }
    
    private func createViews() {
        //
        var lastView: UIView?
        //循环遍历 创建按钮
        for index in 0..<items.count {
            let button = UIButton(type: .custom)
            //设置title
            button.setTitle(items[index], for: .normal)
            //设置颜色
            button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
            button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
            //添加到组件中
            self.addSubview(button)
            //默认选中第一个
            if index == 0 {
                selectedItemButton = button
            }
            //设置button的布局
            button.snp.makeConstraints { (make) in
                if index == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView!.snp.right)
                    make.width.equalTo(lastView!)
                }
                make.top.bottom.equalToSuperview()
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
            }
            lastView = button
            //设置点击事件
            button.addTarget(self, action: #selector(didClickButton(sender:)), for: .touchUpInside)
            itemButtons.append(button)
        }
        indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { (make) in
            make.centerX.equalTo(selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
    }
    
    @objc func didClickButton(sender: UIButton) {
        guard sender != selectedItemButton else {
            return
        }
        selectedItemButton.isSelected = false
        sender.isSelected = true
        selectedItemButton = sender
        self.indicatorView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self.selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

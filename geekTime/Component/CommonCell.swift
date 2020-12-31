//
//  CommonCell.swift
//  geekTime
// 个人中心公共指示条
//  Created by zhj on 2019/11/23.
//  Copyright © 2019 geekbang. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CommonCell: UIControl {
    
    var title: String? {
        didSet {
            self.titleView.text = self.title
        }
    }
    var icon: UIImage? {
        didSet {
            self.iconView.image = self.icon
        }
    }
    
    var titleView: UILabel
    var iconView: UIImageView
    //分割线
    var bottomLine: UIView
    //右边的箭头
    var arrowView: UIImageView
    //点击效果背景
    var hilightView: UIView
    
    override init(frame: CGRect) {
        titleView = UILabel()
        iconView = UIImageView()
        bottomLine = UIView()
        arrowView = UIImageView(image: R.image.icon_right_arrow())
        hilightView = UIView()
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupViews()
    }
    
    func setupViews() {
        //点击效果背景色设置
        self.addSubview(hilightView)
        hilightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        hilightView.isHidden = true
        hilightView.alpha = 0
        hilightView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //左侧图标组件
        self.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            //上下居中显示
            make.centerY.equalToSuperview()
            //设置宽高
            make.width.height.equalTo(32)
        }
        
        //设置标题
        self.addSubview(titleView)
        //文本颜色
        titleView.textColor = UIColor.hexColor(0x333333)
        //字体
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.snp.makeConstraints { (make) in
            //距离图标的右侧有10个像素
            make.left.equalTo(iconView.snp_right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        //右边的箭头
        self.addSubview(arrowView)
        arrowView.snp.makeConstraints { (make) in
            //设置距离右边有20个像素
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        //下划线
        self.addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(white: 0.95, alpha: 1)
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.hilightView.alpha = 1
                self.hilightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.hilightView.alpha = 0
                }) { (finished) in
                    self.hilightView.isHidden = true
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  ViewController.swift
//  geekTime
//  入口viewcontroller，完成底部导航栏组件
//  Created by qiangzhouliang on 2020/12/6.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomItem(HomeViewController(), "首页",normalImg: R.image.home(),selectImg:R.image.home_selected())
        
        bottomItem(MineViewController(), "我的",normalImg: R.image.mine(), selectImg: R.image.mine_selected())
        
    }
    
    //底部公共方法封装
    func bottomItem(_ bVc:BaseViewController, _ title:String,normalImg:UIKit.UIImage?,selectImg:UIKit.UIImage?){
        //设置默认图片
        bVc.tabBarItem.image = normalImg
        //设置选中之后的图片
        bVc.tabBarItem.selectedImage = selectImg?.withRenderingMode(.alwaysOriginal)
        //设置选中的字体颜色
        bVc.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        //设置标题
        bVc.tabBarItem.title = title
        let navigationHomeVc = UINavigationController(rootViewController: bVc)
        self.addChild(navigationHomeVc)
    }
    
}


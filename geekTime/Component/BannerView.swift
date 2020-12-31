//
//  BannerView.swift
//  geekTime
//
//  Created by qiangzhouliang on 2020/12/6.
//

import Foundation
import UIKit
import SnapKit

protocol BannerViewDataSource: AnyObject {
    //表示有几个
    func numberOfBanners(_ bannerView: BannerView) -> Int
    
    //如何展示
    func viewForBanner(_ bannerView: BannerView,index: Int,convertView: UIView) -> UIView
}

//监听banner的点击事件
protocol BannerViewDelegate: AnyObject {
    func didSelectBanner(_ bannerView: BannerView, index: Int)
}

class BannerView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var collectionView: UICollectionView
    var flowLayout: UICollectionViewFlowLayout
    //指示器
    var pageController: UIPageControl
    
    weak var dataSource: BannerViewDataSource?
    weak var delegate: BannerViewDelegate?
    
    //轮播时间片
    var autoScrollInterval: Float = 0
    //是否允许无限轮播
    var isInfinite: Bool = true
    
    //定时器
    var timer: Timer?
    
    override init(frame: CGRect) {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.headerReferenceSize = .zero
        flowLayout.footerReferenceSize = .zero
        //最新行间距
        flowLayout.minimumLineSpacing = .zero
        flowLayout.minimumInteritemSpacing = .zero
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //滚动方向
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView()
    }
    
    required init?(coder: NSCoder) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

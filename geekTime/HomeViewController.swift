//
//  HomeViewController.swift
//  geekTime
//  首页
//  Created by qiangzhouliang on 2020/12/6.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController,BannerViewDataSource,CommonListDelegate {
    //点击条目之后的回调
    func didSelectItem<Item>(_ item: Item) {
        if let product = item as? Product {
            let detailVc = DetailViewController()
            detailVc.product = product
            detailVc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }
    
    func numberOfBanners(_ bannerView: BannerView) -> Int {
        return FakeData.createBanners().count
    }
    
    //返回要显示的视图
    func viewForBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return view
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return imageView
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.navigationController?.navigationBar.backgroundColor = .red
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollInterval = 2
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
        let productList = CommonList<Product,ProductCell>(frame: .zero)
        productList.items = FakeData.createProducts()
        //指定delegate
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints{ make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp_bottom).offset(5)
        }
        
    }

}

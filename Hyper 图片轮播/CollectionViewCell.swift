//
//  CollectionViewCell.swift
//  Hyper 图片轮播
//
//  Created by Xinxibin on 16/11/7.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var imgArr:[UIImage] = []

    @IBOutlet weak var imageView: ImageBrowserImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgArr = [
            UIImage(named:"10.jpg")!,
            UIImage(named:"12.jpg")!,
            UIImage(named:"15.jpg")!,
        ]

        imageView.setData(dataArr: imgArr)
    }

}

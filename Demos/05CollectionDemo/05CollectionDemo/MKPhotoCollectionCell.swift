//
//  MKPhotoCollectionCell.swift
//  05CollectionDemo
//
//  Created by 冯才凡 on 2018/11/11.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit

class MKPhotoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgview: UIImageView!
    override func awakeFromNib() {
        self.selectedBackgroundView = UIView(frame: self.bounds)
        self.selectedBackgroundView?.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        
        super.awakeFromNib()
    }

}

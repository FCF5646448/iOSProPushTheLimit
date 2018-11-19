//
//  FCFMasonryViewLayout.swift
//  05CollectionDemo
//
//  Created by 冯才凡 on 2018/11/19.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit

//protocol FCFMasonryViewLayoutDelegate:NSObjectProtocol {
//    func collectionView:
//}

class FCFMasonryViewLayout: UICollectionViewLayout {
    
    var numberOfColumns:Int = 2 //列数
    var interItemSpacing:CGFloat = 15 //每列之间的间距
    
    //计算contentsize
    override var collectionViewContentSize: CGSize {
        return CGSize()
    }
    
    //计算边框 
    override func prepare() {
        super.prepare()
        
        
    }
    
    //
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let temp:[UICollectionViewLayoutAttributes] = []
        
        return temp
    }
    
    
    
}

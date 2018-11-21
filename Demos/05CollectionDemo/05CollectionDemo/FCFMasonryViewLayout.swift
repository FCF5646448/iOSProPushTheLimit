//
//  FCFMasonryViewLayout.swift
//  05CollectionDemo
//
//  Created by 冯才凡 on 2018/11/19.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit

protocol FCFMasonryViewLayoutDelegate:NSObjectProtocol {
    func collectionView(collection:UICollectionView,layout:FCFMasonryViewLayout,heightForItemAtIndexPath:IndexPath)->CGFloat
}

class FCFMasonryViewLayout: UICollectionViewLayout {
    
    var numberOfColumns:CGFloat = 3 //列数
    var interItemSpacing:CGFloat = 12.5 //每列之间的间距
    
    var lastYValueForColumn:[CGFloat:CGFloat] = [:] //存储每一列的Y值
    var layoutInfo:[IndexPath:UICollectionViewLayoutAttributes] = [:] //缓存每一个item的layout布局属性
    
    weak var delegate:FCFMasonryViewLayoutDelegate?
    
    //计算contentsize 滚动范围
    override var collectionViewContentSize: CGSize {
        var currentColumn:CGFloat = 0
        var maxHeight:CGFloat = 0
        while currentColumn < self.numberOfColumns {
            let height:CGFloat = self.lastYValueForColumn[currentColumn]!
            if height > maxHeight {
                maxHeight = height
            }
            currentColumn += 1
        }
        return CGSize(width: self.collectionView!.frame.size.width, height: maxHeight)
    }
    
    //这个方法是在布局快要生效时调用，所以在这个函数里计算好每一个item的position和size。并将其缓存下来，这有助于滚动的流畅性。
    override func prepare() {
        super.prepare()
        var currentColumn:CGFloat = 0.0
        let fullWidth = self.collectionView!.frame.size.width
        let availableSpaceExcludingPadding = fullWidth - (self.interItemSpacing * (self.numberOfColumns + 1))
        let itemwidth = availableSpaceExcludingPadding/self.numberOfColumns
        
        let numSections = self.collectionView!.numberOfSections
        var indexPath:IndexPath!
        
        var section:Int = 0
        while section < numSections {
            let numItems = self.collectionView!.numberOfItems(inSection: section)
            var item:Int = 0
            while item < numItems {
                indexPath = IndexPath(item: item, section: section)
                let itemAttributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
                
                let x:CGFloat = self.interItemSpacing + (self.interItemSpacing + itemwidth) * currentColumn
                var y:CGFloat = Int(currentColumn) < self.lastYValueForColumn.count ?   (self.lastYValueForColumn[currentColumn]!) : 0
                let height:CGFloat = (self.delegate?.collectionView(collection: self.collectionView!, layout: self, heightForItemAtIndexPath: indexPath))!
                
                itemAttributes.frame = CGRect(x: x, y: y, width: itemwidth, height: height)
                
                y += height
                y += self.interItemSpacing
                
                self.lastYValueForColumn[currentColumn] = y
                
                currentColumn += 1
                
                if currentColumn == self.numberOfColumns {
                    currentColumn = 0
                }
                
                self.layoutInfo[indexPath] = itemAttributes
                
                item += 1
            }
            
            section += 1
        }
    }
    
    //返回某个特定区域布局的属性集合数据，
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var allAttributes:[UICollectionViewLayoutAttributes] = []
        for attribute in self.layoutInfo {
            let att:UICollectionViewLayoutAttributes = attribute.value
            if rect.intersects(att.frame) {
                allAttributes.append(att)
            }
        }
        
        return allAttributes
    }
}

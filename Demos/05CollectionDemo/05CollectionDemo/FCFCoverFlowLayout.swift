//
//  FCFCoverFlowLayout.swift
//  05CollectionDemo
//
//  Created by 冯才凡 on 2018/11/21.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit

class FCFCoverFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        self.scrollDirection = .horizontal
        let size = self.collectionView!.frame.size
        self.itemSize = CGSize(width: size.width/4.0, height: size.height*0.7)
        self.sectionInset = UIEdgeInsets(top: size.height*0.15, left:size.height*0.1 , bottom: size.height*0.15, right: size.height*0.1)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        let visibleRect = CGRect(origin: self.collectionView!.contentOffset, size: self.collectionView!.bounds.size)
        let collectionViewHalfFrame = self.collectionView!.frame.size.width/2.0
        
        for attribute in array! {
            if attribute.frame.intersects(rect) {
                let distance = visibleRect.midX - attribute.center.x
                let normalizedDistance = distance / collectionViewHalfFrame
                if abs(distance) < collectionViewHalfFrame {
                    let zoom = 1 + 0.35 * (1 - abs(normalizedDistance))
                    var rotationAndPerspectiveTransform:CATransform3D = CATransform3DIdentity
                    rotationAndPerspectiveTransform.m34 = 1.0 / -500
                    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, normalizedDistance * CGFloat(M_PI_4), 0.0, 1.0,0.0)
                    
                    let zoomTransform:CATransform3D = CATransform3DMakeScale(zoom, zoom,1.0)
                    attribute.transform3D = CATransform3DConcat(zoomTransform, rotationAndPerspectiveTransform)
                    attribute.zIndex = Int(abs(normalizedDistance) + 10.0)
                    var alpha = (1-abs(normalizedDistance)) + 1.0
                    if alpha > 1.0 {
                        alpha = 1.0
                        attribute.alpha = alpha
                    }else{
                        attribute.alpha = 0.0
                    }
                    
                }
            }
            
        }
        
        return array
    }
}

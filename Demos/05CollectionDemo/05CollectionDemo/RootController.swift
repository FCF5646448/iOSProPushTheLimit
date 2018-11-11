//
//  RootController.swift
//  05CollectionDemo
//
//  Created by 冯才凡 on 2018/11/11.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit

/*
 *  1、最大的问题就是，读取bundle下文件夹。
 */


class RootController: UIViewController {

    lazy var collection:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 128, height: 128)
        
        //flowLayout 一定要放在初始化方法中，否则会报错。
        let collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), collectionViewLayout: flowLayout)
        collectionview.layer.contents = UIImage(named: "DSC00705.JPG")?.cgImage
        collectionview.backgroundColor = UIColor.white
        collectionview.register(UINib.init(nibName: "MKPhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MKPhotoCollectionCell")
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    //获取目录下photos文件夹下资源
    lazy var photoList:[String] = {
        let path = Bundle.main.resourcePath!.components(separatedBy: "Photos") // Bundle.main.resourceURL!.appendingPathComponent("Photos").path
        if let list = try? FileManager.default.contentsOfDirectory(atPath: path.first ?? "").filter({$0.hasSuffix("JPG")}) {
            return list
        }
        return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "photo"
        
        initUI()
    }
    
    func initUI(){
        view.addSubview(self.collection)
    }
    
}

extension RootController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension RootController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MKPhotoCollectionCell = collection.dequeueReusableCell(withReuseIdentifier: "MKPhotoCollectionCell", for: indexPath) as! MKPhotoCollectionCell
        
        let photoName = self.photoList[indexPath.row]
        
        let photoFilePath = String(format: "%@/%@", Bundle.main.resourcePath!.components(separatedBy: "Photos").first ?? "",photoName)
        
        let img = UIImage(contentsOfFile: photoFilePath)
        
        UIGraphicsBeginImageContext(CGSize(width: 128, height: 128))
        img?.draw(in: CGRect(x: 0, y: 0, width: 128.0, height: 128.0))
        cell.imgview.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return cell
    }
}

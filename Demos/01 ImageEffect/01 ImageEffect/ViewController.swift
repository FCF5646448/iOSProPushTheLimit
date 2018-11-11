//
//  ViewController.swift
//  01 ImageEffect
//
//  Created by 冯才凡 on 2018/11/8.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var layer:CALayer!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
        self.layer = CALayer()
        self.layer.frame = CGRect(x: 80, y: 100, width: 160, height: 160)
        self.view.layer.addSublayer(self.layer)
        
        //
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, true, scale)
        self.view.drawHierarchy(in: self.view.frame, afterScreenUpdates: false)
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imgref = image?.cgImage?.cropping(to: CGRect(x: self.layer.frame.origin.x * scale, y: self.layer.frame.origin.y * scale, width: self.layer.frame.size.width * scale, height: self.layer.frame.size.height * scale))
        image = UIImage.init(cgImage: imgref!)
        
        image = image?.applyBlur(withRadius: 50.0, tintColor: UIColor(red: 0, green: 1, blue: 0, alpha: 0.1), saturationDeltaFactor: 2, maskImage: nil)
        self.layer.contents = image?.cgImage
        
        
        
    }
    @IBAction func addAction(_ sender: Any) {
        let test:TestViewController = TestViewController()
        test.view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        test.view.backgroundColor = UIColor.red
        self.view.addSubview(test.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


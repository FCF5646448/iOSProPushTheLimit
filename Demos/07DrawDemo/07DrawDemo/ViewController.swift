//
//  ViewController.swift
//  07DrawDemo
//
//  Created by 冯才凡 on 2018/11/21.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Draw"
        
    }
    
    override func loadView() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let customview = UIView() //不用设置frame 默认就是整个页面的frame
        self.view = customview
        customview.backgroundColor = UIColor.gray
        
        let sublayer = CALayer()
        sublayer.frame = CGRect(x: (width-200)/2.0 , y: (height-200)/2.0, width: 200, height: 200)
        sublayer.backgroundColor = UIColor.blue.cgColor
        customview.layer.addSublayer(sublayer)
        
        sublayer.delegate = self //换成 self.view.layer 不会走代理
        
        sublayer.display() //必须手动调用这个才会开始执行绘制代理
    }
    
}

extension ViewController:CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        print("xxxxx")
        UIColor.red.setFill()
        ctx.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
    }
}


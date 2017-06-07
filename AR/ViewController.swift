//
//  ViewController.swift
//  AR
//
//  Created by Yuuki on 2017/6/6.
//  Copyright © 2017年 Yuuki. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSessionDelegate, ARSCNViewDelegate {
    
    var scnView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //AR 的SCNView 还有一个2d的view ARSKView
        scnView = ARSCNView(frame: view.bounds, options: nil)
        
        scnView.delegate = self
        scnView.session.delegate = self
        
        view.addSubview(scnView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //ARSession 的配置对象 有两个
        //ARSessionConfiguration 和 ARWorldTrackingSessionConfiguration
        //第一个不会水平移动 第二个会  第二个默认带地面识别
        let config = ARWorldTrackingSessionConfiguration()
        
        //目前就一个
        //config.planeDetection = .horizontal
        
        //开始运行
        scnView.session.run(config)
        
        
        addObject()
        
    }
    
    func addObject() {
        //初始化一个场景
        let scene = SCNScene()
        
        //这里写了几个字  具体有哪些内容参照 SceneKit
        let text = SCNText(string: "Yuuki ~~", extrusionDepth: 5)
        text.firstMaterial?.diffuse.contents = UIColor.red
        text.firstMaterial?.specular.contents = UIColor.white
        
        //在场景中添加一个节点
        let node = SCNNode(geometry: text)
        //改变一下位置 不然可能看不到这个
        node.position = SCNVector3(0, -0.1, -2)
        //更改缩放  不然太大了
        node.scale = SCNVector3(0.05, 0.05, 0.05)
        scene.rootNode.addChildNode(node)
        
        //将场景设置给scnView显示
        scnView.scene = scene
        //默认光源
        scnView.autoenablesDefaultLighting = true
    }
    
    /*
     ARSession 的几个代理方法 具体怎么用还不是很清楚
     */
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
//        print("frame \(frame.anchors)")
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//        print("anchors \(anchors)")
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
//        print("cameraDidChangeTrackingState \(camera)")
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        print("didAdd \(anchors)")
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        print("didFailWithError \(error)")
    }
    
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
        print("didRemove \(anchors)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


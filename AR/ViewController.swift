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
        
        
        scnView = ARSCNView(frame: view.bounds, options: nil)
        view.addSubview(scnView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config = ARWorldTrackingSessionConfiguration()
        scnView.session.run(config, options: .resetTracking)
        scnView.delegate = self
        scnView.session.delegate = self
        
        addObject()
        
    }
    
    func addObject() {
        let scene = SCNScene()
        
        let text = SCNText(string: "Yuuki ~~", extrusionDepth: 5)
        text.firstMaterial?.diffuse.contents = UIColor.red
        text.firstMaterial?.specular.contents = UIColor.white
        let node = SCNNode(geometry: text)
        node.position = SCNVector3(0, -0.1, -2)
        node.scale = SCNVector3(0.05, 0.05, 0.05)
        scene.rootNode.addChildNode(node)
        scnView.scene = scene
        scnView.autoenablesDefaultLighting = true
    }
    
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


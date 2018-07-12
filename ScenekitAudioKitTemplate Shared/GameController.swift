//
//  GameController.swift
//  ScenekitAudioKitTemplate Shared
//
//  Created by kl on 7/11/18.
//  Copyright © 2018 kl. All rights reserved.
//


import SceneKit
import AudioKit

#if os(macOS)
    typealias SCNColor = NSColor
#else
    typealias SCNColor = UIColor
#endif

class GameController: NSObject, SCNSceneRendererDelegate {

    let scene: SCNScene
    let sceneRenderer: SCNSceneRenderer
    
    init(sceneRenderer renderer: SCNSceneRenderer) {
        sceneRenderer = renderer
        scene = SCNScene(named: "Art.scnassets/ship.scn")!
        
        super.init()
        
        sceneRenderer.delegate = self
        
        if let ship = scene.rootNode.childNode(withName: "ship", recursively: true) {
            ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
        }
        
        sceneRenderer.scene = scene
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // Called before each frame is rendered
    }

}

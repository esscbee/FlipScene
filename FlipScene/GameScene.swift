//
//  GameScene.swift
//  FlipScene
//
//  Created by Stephen Brennan on 8/1/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            var found = false
            
            for n in nodesAtPoint(location) {
                if let skr = n as? SKReferenceNode {
                    found = true
                    skr.xScale = -skr.xScale
                }
            }
            
            if !found {
                let resourcePath = NSBundle.mainBundle().pathForResource("Flipper", ofType: "sks")
                let newFlipper = SKReferenceNode (URL: NSURL (fileURLWithPath: resourcePath!))
                addChild(newFlipper)
                newFlipper.position = location
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

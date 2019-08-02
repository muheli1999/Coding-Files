//
//  GameScene.swift
//  Dino Game
//
//  Created by Steve Li on 8/1/19.
//  Copyright © 2019 Steve Li. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //declare global variables, such as dinosaur and sound effects
    let dinosaur = SKSpriteNode(imageNamed: "dinosaur")
    //let jumpSound = SKAction.playSoundFileNamed("jumpSoundEffect.wav", waitForCompletion: false)
    
    func random(min: CGFloat, max: CGFloat)->CGFloat{
        //return CGFloat(floorf(Float(CGFloat(arc4random() / 0xFFFFFFFF) * (max-min)+min)))
        return CGFloat(Float.random(in: 0...1))*(max-min)
    }
    
    var gameArea: CGRect
    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height/maxAspectRatio
        let margin = (size.width - playableWidth)/2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        dinosaur.setScale(0.3)
        dinosaur.position = CGPoint(x: self.size.width/8, y: self.size.height/2)
        dinosaur.zPosition = 2
        self.addChild(dinosaur)
        startNewLevel()
    }
  
    func startNewLevel(){
        let spawn = SKAction.run(spawnCactus)
        //let cactusInterval = random(min: 0.1, max: 3)
        let waitToSpawn = SKAction.wait(forDuration: 2)
        let spawnSequence = SKAction.sequence([waitToSpawn, spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever)
    }
    
    func spawnCactus(){
        let cactus = SKSpriteNode(imageNamed: "cactus")
        cactus.setScale(0.7)
        let startPoint = CGPoint(x: self.size.width+cactus.size.width/2, y: self.size.height/2+cactus.size.height/2)
        cactus.position = startPoint
        cactus.zPosition = 2
        self.addChild(cactus)
        
        let waitToSpawn = SKAction.wait(forDuration: TimeInterval(random(min: 0.5, max: 2)))
        let moveCactus = SKAction.moveTo(x: -cactus.size.width, duration: 3)
        let deleteCactus = SKAction.removeFromParent()
        let cactusSequence = SKAction.sequence([waitToSpawn, moveCactus,deleteCactus])
        cactus.run(cactusSequence)
    }
    
    func jump(){
        let jumpUp = SKAction.moveTo(y: self.size.height*0.75, duration: 0.25)
        let jumpDown = SKAction.moveTo(y: self.size.height*0.5, duration: 0.25)
        let jumpSequence = SKAction.sequence([jumpUp,jumpDown])//may add jumpSound
        dinosaur.run(jumpSequence)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        jump()
    
    }
    
  
}

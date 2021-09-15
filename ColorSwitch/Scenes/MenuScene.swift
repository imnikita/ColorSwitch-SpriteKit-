//
//  MenuScene.swift
//  ColorSwitch
//
//  Created by user on 14.09.2021.
//

import SpriteKit

class MenuScene: SKScene {

    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        addLogo()
        addLabels()
    }
    
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.size.width / 4, height: frame.size.width / 4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height / 4)
        
        addChild(logo)
    }
    
    func addLabels() {
        let playLabel = SKLabelNode(text: "Tap to play!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50
        playLabel.fontColor = .white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)
        animate(label: playLabel)
        
        let highScoreLabel = SKLabelNode(text: "Highest score:"
                                            + " \(UserDefaults.standard.integer(forKey: "highestScore"))")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40
        highScoreLabel.fontColor = .white
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height * 4)
        addChild(highScoreLabel)
        
        let recentScore = SKLabelNode(text: "Resent score:"
                                        + " \(UserDefaults.standard.integer(forKey: "recentScore"))")
        recentScore.fontName = "AvenirNext-Bold"
        recentScore.fontSize = 40
        recentScore.fontColor = .white
        recentScore.position = CGPoint(x: frame.midX, y: highScoreLabel.position.y - recentScore.frame.size.height * 2)
        addChild(recentScore)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view?.presentScene(gameScene)
    }
    
    func animate(label: SKLabelNode) {
//        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
//        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        
        let sequence = SKAction.sequence([scaleUp, scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
}

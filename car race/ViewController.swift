//
//  ViewController.swift
//  car race
//
//  Created by christopher white on 2/25/18.
//  Copyright © 2018 christopher white. All rights reserved.
//

import UIKit
protocol subviewDelegate {
    func changeSomething()
}

class ViewController: UIViewController, subviewDelegate {
    func changeSomething() {
        /*
            if (self.Player.frame.intersects(carView.frame) == true){
                point_dncrease()
            }
        */
    }
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    @IBOutlet weak var Player: DraggedImageView!
    @IBOutlet weak var road: UIImageView!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var gameOver: UIImageView!
    @IBOutlet weak var Points: UILabel!
    @IBOutlet weak var FinalScore: UILabel!
    @IBAction func PlayAgainAction(_ sender: Any) {
        viewDidLoad()
        FinalScore.text = "Final Score:"
        road.isHidden = false
        Points.isHidden = false
        Player.isHidden = false
        playAgain.isHidden = true
        gameOver.isHidden = true
        FinalScore.isHidden = true
    }
    
    var pointIncrease = 0
    let randomCar = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
    
    func game_Over(){
        self.view.backgroundColor = UIColor.black
        self.Points.text = "0"
        self.Points.isHidden = true
        self.road.isHidden = true
        self.Player.isHidden = true
        self.playAgain.isHidden = false
        self.gameOver.isHidden = false
        self.FinalScore.text = (self.FinalScore.text! + String(pointIncrease))
        self.FinalScore.isHidden = false
    }
    func point_Increase(){
        pointIncrease = pointIncrease + 10
        self.Points.text = String(pointIncrease)
    }
    
    func point_dncrease(){
        pointIncrease = pointIncrease - 10
        self.Points.text = String(pointIncrease)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Player.myDelegate = self
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: [])
        var imageArray: [UIImage]!
        imageArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!,
                      UIImage(named: "road20.png")!]
        road.image = UIImage.animatedImage(with: imageArray, duration: 1)
        
            for index in 0...16{
                let delay = Double(randomCar[index])
                let when = DispatchTime.now() + delay
                DispatchQueue.main.asyncAfter(deadline: when)
                {
                    let random_Car = arc4random_uniform(6) + 1
                    let xPosition = arc4random_uniform(250) + 50
                    let carView = UIImageView(image: nil)
                    
                    switch (random_Car){
                        case 1:
                            carView.image = UIImage(named: "car1.png")
                        
                        case 2:
                            carView.image = UIImage(named: "car2.png")
                        
                        case 3:
                            carView.image = UIImage(named: "car3.png")
                        
                        case 4:
                            carView.image = UIImage(named: "car4.png")
                        
                        case 5:
                            carView.image = UIImage(named: "car5.png")
                        
                        case 6:
                            carView.image = UIImage(named: "car6.png")
                        
                        default:
                            carView.image = UIImage(named: "car1.png")
                    }
                    carView.frame = CGRect(x:Int(xPosition), y: 20, width: 60, height: 60)
                    self.view.addSubview(carView)
                    self.view.bringSubview(toFront: carView)
                    self.dynamicItemBehavior.addItem(carView)
                    self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 600), for: carView)
                    self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                    self.collisionBehavior = UICollisionBehavior(items: [carView])
                    self.collisionBehavior.addBoundary(withIdentifier: "barrier" as
                        NSCopying, for: UIBezierPath(rect: self.Player.frame))
                   self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                   self.dynamicAnimator.addBehavior(self.collisionBehavior)
                   self.point_Increase()
                }
            }
       let GameOver = DispatchTime.now() + 20
            DispatchQueue.main.asyncAfter(deadline: GameOver){
                self.game_Over()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


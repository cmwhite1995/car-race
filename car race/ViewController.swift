//
//  ViewController.swift
//  car race
//
//  Created by christopher white on 2/25/18.
//  Copyright © 2018 christopher white. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    @IBOutlet weak var road: UIImageView!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var gameOver: UIImageView!
    @IBOutlet weak var redcar: UIImageView!
    @IBAction func PlayAgainAction(_ sender: Any) {
        self.road.isHidden = false
        self.redcar.isHidden = false
        self.playAgain.isHidden = true
        self.gameOver.isHidden = true
        // reset the timer
        
    }
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
  /*  func restart(){
        gameover.isHidden = true
        playercar position = X=489 y = 158
        timer = 0
      } */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageArray: [UIImage]!
        let randomCar = [1,2,3,4,5,6]
        
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
        
            for index in 0...5
            {
                let delay = Double(randomCar[index])
                let when = DispatchTime.now() + delay
                
                DispatchQueue.main.asyncAfter(deadline: when)
                {
                    let randomCar = arc4random_uniform(6) + 1
                    let xPosition = arc4random_uniform(350) + 50
                    let carView = UIImageView(image: nil)
                    
                    switch (randomCar)
                    {
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
                    carView.frame = CGRect(x:Int(xPosition), y: 20, width: 30, height: 50)
                    self.view.addSubview(carView)
                    self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
                    self.dynamicItemBehavior = UIDynamicItemBehavior(items: [carView])
                    self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 760), for: carView)
                    self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                }
            }
        
        
        
        
        
       
        let GameOver = DispatchTime.now() + 20
/*
 
      DispatchQueue.main.asyncAfter(deadline: GameOver){
            self.view.backgroundColor = UIColor.black
            self.road.isHidden = true
            self.redcar.isHidden = true
            self.playAgain.isHidden = false
            self.gameOver.isHidden = false
            
        //    self.replayButton.isHidden = false
            //Create a new image view and assign an image
           // let gameOver = UIImageView(image: UIImage(named: "game_over.jpg"))
            //Make this image view fulfil the screen
           // gameOver.frame = UIScreen.main.bounds
            //Add the image view to the main view
            
           // self.view.addSubview(gameOver)
        }
    */
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//
//  ViewController.swift
//  car race
//
//  Created by christopher white on 2/25/18.
//  Copyright © 2018 christopher white. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var road: UIImageView!
   // @IBOutlet weak var BlueCar: UIImageView!
    @IBOutlet weak var redcar: UIImageView!
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var carArray:   [UIImage]!
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
        
        carArray = [UIImage(named:  "car0.png")!,
                    UIImage(named:  "car1.png")!]
         road.image = UIImage.animatedImage(with: imageArray, duration: 1)
        
        let first = DispatchTime.now() + 2
        let second = DispatchTime.now() + 4
        DispatchQueue.main.asyncAfter(deadline: first) {
            let carView = UIImageView(image: nil)
            //Assign an image to the image view
            carView.image = UIImage(named: "car1.png")
            //Assign the size and position of the image view
            carView.frame = CGRect(x:100, y: 100, width: 30, height: 50)
            //Add the image view to the main view
            self.view.addSubview(carView)
        }
        DispatchQueue.main.asyncAfter(deadline: second) {
            let carView = UIImageView(image: nil)
            //Assign an image to the image view
            carView.image = UIImage(named: "car1.png")
            //Assign the size and position of the image view
            carView.frame = CGRect(x:300, y: 100, width: 30, height: 50)
            //Add the image view to the main view
            self.view.addSubview(carView)
        }
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


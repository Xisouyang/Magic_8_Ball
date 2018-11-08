//
//  ViewController.swift
//  Magic8
//
//  Created by Stephen Ouyang on 10/27/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    var shakeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
    var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
    let textArr = ["Yes", "No", "Maybe"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let eightBallImg = UIImage(named: "Magic_eight_ball.png")
        let eightBall = UIImageView(image: eightBallImg)
        eightBall.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        eightBall.frame.origin.x = (self.view.frame.width / 2) - eightBall.frame.size.width/2
        eightBall.frame.origin.y = (self.view.frame.height/2) - eightBall.frame.size.height/2
        view.addSubview(eightBall)
        
        shakeButton.setTitle("Shake It!", for: .normal)
        shakeButton.setTitleColor(.blue, for: .normal)
        shakeButton.frame.origin.x = (self.view.frame.width/2) - (shakeButton.frame.size.width/2)
        shakeButton.frame.origin.y = self.view.frame.height/2 + (eightBall.frame.size.height)
        shakeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(shakeButton)
        
        textLabel.center.y = view.center.y
        textLabel.center.x = view.center.x
        textLabel.text = "Question?"
        textLabel.font = UIFont.boldSystemFont(ofSize: 10)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        self.view.addSubview(textLabel)
        
        titleLabel.text = "Magic 8 Ball"
        titleLabel.frame.origin.x = (self.view.frame.width / 2) - (textLabel.frame.size.width)
        titleLabel.frame.origin.y = self.view.frame.height/2 - (eightBall.frame.size.height)
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        generateResponse()
    }
    
    func generateResponse() {
        let maxCount = textArr.count
        let randomIndex = Int(arc4random_uniform(UInt32(maxCount)))
        textLabel.text = textArr[randomIndex]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateResponse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


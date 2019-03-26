//
//  ViewController.swift
//  EWArcAnimation
//
//  Created by Ethan.Wang on 2019/3/26.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let firstView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.alpha = 0
        view.image = UIImage(named: "bai")
        return view
    }()
    private let secondView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.alpha = 0
        view.image = UIImage(named: "qianse")
        return view
    }()
    private let thirdView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.image = UIImage(named: "bai")
        view.alpha = 0
        return view
    }()
    private let fourthView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.image = UIImage(named: "qianse")
        view.alpha = 0
        return view
    }()

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 110, y: 200, width: 50, height: 50))
        button.backgroundColor = UIColor.brown
        button.addTarget(self, action: #selector(beginAnimation), for: .touchUpInside)
        return button
    }()
    private var isOpen: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawMyView()
    }
    private func drawMyView(){
        self.view.addSubview(firstView)
        self.view.addSubview(secondView)
        self.view.addSubview(thirdView)
        self.view.addSubview(fourthView)
        secondView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        thirdView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        fourthView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.view.addSubview(button)
    }

    @objc private func beginAnimation(){

        let transform1 = CGAffineTransform(rotationAngle: .pi/4)
        let transform2 = CGAffineTransform(rotationAngle: .pi/2)
        let transform3 = CGAffineTransform(rotationAngle: .pi/4*3)

        UIView.animate(withDuration: 1.5) {
            if self.isOpen {
                self.secondView.transform = CGAffineTransform.identity
                self.thirdView.transform = CGAffineTransform.identity
                self.fourthView.transform = CGAffineTransform.identity
                self.secondView.alpha = 0
                self.thirdView.alpha = 0
                self.fourthView.alpha = 0
                self.isOpen = !self.isOpen
            } else {
                self.secondView.transform = transform1
                self.thirdView.transform = transform2
                self.fourthView.transform = transform3
                self.secondView.alpha = 1
                self.thirdView.alpha = 1
                self.fourthView.alpha = 1
                self.isOpen = !self.isOpen
            }
        }
    }

}


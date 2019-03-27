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
        view.image = UIImage(named: "pink")
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
        view.image = UIImage(named: "pink")
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
    private var isAnimationIng: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawMyView()
    }
    private func drawMyView() {
        self.view.addSubview(firstView)
        self.view.addSubview(secondView)
        self.view.addSubview(thirdView)
        self.view.addSubview(fourthView)
        firstView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        secondView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        thirdView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        fourthView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.view.addSubview(button)
    }

    @objc private func beginAnimation() {

        guard self.isAnimationIng == false else { return }

        let transform1 = CGAffineTransform(rotationAngle: .pi/4)
        let transform2 = CGAffineTransform(rotationAngle: .pi/2)
        let transform3 = CGAffineTransform(rotationAngle: .pi/4*3)

        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [.allowUserInteraction], animations: {
            self.isAnimationIng = true
            if self.isOpen {
                self.secondView.transform = CGAffineTransform.identity
                self.thirdView.transform = CGAffineTransform.identity
                self.fourthView.transform = CGAffineTransform.identity
                self.firstView.alpha = 0
                self.secondView.alpha = 0
                self.thirdView.alpha = 0
                self.fourthView.alpha = 0
                self.isOpen = !self.isOpen
            } else {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                    self.firstView.alpha = 1
                    self.secondView.alpha = 1
                    self.thirdView.alpha = 1
                    self.fourthView.alpha = 1
                })
                self.secondView.transform = transform1
                self.thirdView.transform = transform2
                self.fourthView.transform = transform3
                self.isOpen = !self.isOpen
            }
        }) { (_) in
            self.isAnimationIng = false
        }

    }

}

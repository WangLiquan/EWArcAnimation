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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 94.5))
        label.text = "第一"
        label.textAlignment = .center
        /// 将label旋转90度
        label.transform = CGAffineTransform(rotationAngle: -.pi/2)
        view.addSubview(label)
        view.image = UIImage(named: "pink")
        /// 修改imageView的锚点,使其旋转时以自定义的锚点为中心点
        view.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        return view
    }()
    private let secondView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.alpha = 0
        view.image = UIImage(named: "qianse")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 94.5))
        label.text = "第二"
        label.textAlignment = .center
        /// 将label旋转90度
        label.transform = CGAffineTransform(rotationAngle: -.pi/2)
        view.addSubview(label)
        /// 修改imageView的锚点,使其旋转时以自定义的锚点为中心点
        view.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        return view
    }()
    private let thirdView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.image = UIImage(named: "pink")
        view.alpha = 0
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 94.5))
        label.text = "第三"
        label.textAlignment = .center
        /// 将label旋转90度
        label.transform = CGAffineTransform(rotationAngle: -.pi/2)
        view.addSubview(label)
        /// 修改imageView的锚点,使其旋转时以自定义的锚点为中心点
        view.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        return view
    }()
    private let fourthView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 200, y: 500, width: 120.6, height: 94.5))
        view.image = UIImage(named: "qianse")
        view.alpha = 0
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 94.5))
        label.text = "第四"
        label.textAlignment = .center
        /// 将label旋转90度
        label.transform = CGAffineTransform(rotationAngle: -.pi/2)
        view.addSubview(label)
        /// 修改imageView的锚点,使其旋转时以自定义的锚点为中心点
        view.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        return view
    }()

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 110, y: 200, width: 50, height: 50))
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("动画", for: .normal)
        button.addTarget(self, action: #selector(beginAnimation), for: .touchUpInside)
        return button
    }()
    /// 记录view现在的状态,true为展开状态,false为关闭状态
    private var isOpen: Bool = false
    /// 记录动画是否在进行中,true为进行中,false为非进行中
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
        self.view.addSubview(button)
    }

    @objc private func beginAnimation() {
        /// 保证动画在非进行中
        guard self.isAnimationIng == false else { return }
        /// 分别设定三个imageView的旋转角度
        let transform1 = CGAffineTransform(rotationAngle: .pi/4)
        let transform2 = CGAffineTransform(rotationAngle: .pi/2)
        let transform3 = CGAffineTransform(rotationAngle: .pi/4*3)
        /// 关键帧动画
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [.allowUserInteraction], animations: {
            /// 动画进行中
            self.isAnimationIng = true
            /// view展开状态
            if self.isOpen {
                /// 将View复原
                self.secondView.transform = CGAffineTransform.identity
                self.thirdView.transform = CGAffineTransform.identity
                self.fourthView.transform = CGAffineTransform.identity
                self.firstView.alpha = 0
                self.secondView.alpha = 0
                self.thirdView.alpha = 0
                self.fourthView.alpha = 0
                self.isOpen = !self.isOpen
            } else {
                /// 添加关键帧, 在前0.2秒将View展示
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                    self.firstView.alpha = 1
                    self.secondView.alpha = 1
                    self.thirdView.alpha = 1
                    self.fourthView.alpha = 1
                })
                /// 在1.5秒时间进行旋转动画
                self.secondView.transform = transform1
                self.thirdView.transform = transform2
                self.fourthView.transform = transform3
                self.isOpen = !self.isOpen
            }
        }) { (_) in
            /// 结束时设置动画进行中状态为False
            self.isAnimationIng = false
        }

    }

}

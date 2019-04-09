//
//  EWArcAnimationView.swift
//  EWArcAnimation
//
//  Created by Ethan.Wang on 2019/4/4.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class EWArcAnimationView: UIView {

    /// 点击分类按钮回调,返回分类
    var backType: ((String) -> Void)?

    private var isAnimationIng: Bool = false

    private lazy var homeButton: EWArcAnimationSubImageView = {
        let view = EWArcAnimationSubImageView(frame:CGRect(x: 60.3, y: 69, width: 120.6, height: 94.5), title: "首页", image: "ArcAnimation_home", backImage: "ArcAnimation_white")
        view.backClick = { [weak self] in
            if self?.backType != nil {
                self?.backType!("首页")
            }
        }
        return view
    }()
    private lazy var nameButton: EWArcAnimationSubImageView = {
        let view = EWArcAnimationSubImageView(frame:CGRect(x: 60.3, y: 69, width: 120.6, height: 94.5), title: "姓名", image: "ArcAnimation_name", backImage: "ArcAnimation_pink")
        view.backClick = { [weak self] in
            if self?.backType != nil {
                self?.backType!("姓名")
            }
        }
        return view
    }()
    private lazy var industrybutton: EWArcAnimationSubImageView = {
        let view = EWArcAnimationSubImageView(frame:CGRect(x: 60.3, y: 69, width: 120.6, height: 94.5), title: "行业", image: "ArcAnimation_industry", backImage: "ArcAnimation_white")
        view.backClick = { [weak self] in
            if self?.backType != nil {
                self?.backType!("行业")
            }
        }
        return view
    }()
    private lazy var locationButton: EWArcAnimationSubImageView = {
        let view = EWArcAnimationSubImageView(frame:CGRect(x: 60.3, y: 69, width: 120.6, height: 94.5), title: "地址", image: "ArcAnimation_location", backImage: "ArcAnimation_pink")
        view.backClick = { [weak self] in
            if self?.backType != nil {
                self?.backType!("地址")
            }
        }
        return view
    }()
    private let setingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 235 - 79 - 68, y: 190 - 32 - 68, width: 68, height: 68))
        button.setImage(UIImage(named: "CircleSelect_select"), for: .normal)
        button.setImage(UIImage(named: "CircleSelect_select"), for: .selected)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawMyView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawMyView() {
        self.addSubview(homeButton)
        self.addSubview(nameButton)
        self.addSubview(industrybutton)
        self.addSubview(locationButton)
        self.addSubview(setingButton)
        setingButton.addTarget(self, action: #selector(onClickSetingButton), for: .touchUpInside)
    }
    @objc private func onClickSetingButton() {
        setingButton.isSelected = !setingButton.isSelected
        if setingButton.isSelected {
            show()
        } else {
            hidden()
        }
    }
    @objc private func show() {
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
            /// 添加关键帧, 在前0.2秒将View展示
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.homeButton.alpha = 1
                self.nameButton.alpha = 1
                self.industrybutton.alpha = 1
                self.locationButton.alpha = 1
            })
            /// 在1.5秒时间进行旋转动画
            self.nameButton.transform = transform1
            self.industrybutton.transform = transform2
            self.locationButton.transform = transform3
        }) { (_) in
            /// 结束时设置动画进行中状态为False
            self.isAnimationIng = false
        }

    }
    @objc private func hidden() {
        /// 保证动画在非进行中
        guard self.isAnimationIng == false else { return }
        /// 关键帧动画
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [.allowUserInteraction], animations: {
            /// 动画进行中
            self.isAnimationIng = true
            /// view展开状态
            /// 将View复原
            self.nameButton.transform = CGAffineTransform.identity
            self.industrybutton.transform = CGAffineTransform.identity
            self.locationButton.transform = CGAffineTransform.identity
            self.homeButton.alpha = 0
            self.nameButton.alpha = 0
            self.industrybutton.alpha = 0
            self.locationButton.alpha = 0
        }) { (_) in
            /// 结束时设置动画进行中状态为False
            self.isAnimationIng = false
        }
    }

}

extension EWArcAnimationView {
    class EWArcAnimationSubImageView: UIImageView {
        public var backClick: ( () -> Void )?
        private let imageView: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 30.75, width: 33, height: 33))
            imageView.transform = CGAffineTransform(rotationAngle: -.pi/2)
            return imageView
        }()
        private let label: UILabel = {
            let label =  UILabel(frame: CGRect(x: 35, y: 0, width: 40, height: 94.5))
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.transform = CGAffineTransform(rotationAngle: -.pi/2)
            return label
        }()
        private let button: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 22.25, width: 60, height: 50))
            return button
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            drawMyView()
        }
        init(frame: CGRect, title: String, image: String, backImage: String) {
            super.init(frame: frame)
            drawMyView()
            self.label.text = title
            self.imageView.image = UIImage(named: image)
            self.image = UIImage(named: backImage)
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        private func drawMyView() {
            self.alpha = 0
            self.layer.anchorPoint = CGPoint(x: 1, y: 0.485)
            self.isUserInteractionEnabled = true
            self.addSubview(imageView)
            self.addSubview(label)
            self.addSubview(button)
            button.addTarget(self, action: #selector(onClickSubButton), for: .touchUpInside)
        }
        @objc private func onClickSubButton() {
            if backClick != nil {
                backClick!()
            }
        }
    }
}

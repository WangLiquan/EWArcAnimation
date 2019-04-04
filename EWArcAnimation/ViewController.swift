//
//  ViewController.swift
//  EWArcAnimation
//
//  Created by Ethan.Wang on 2019/3/26.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let animationView: EWArcAnimationView = {
        let view = EWArcAnimationView(frame: CGRect(x: 100, y: 450, width: 235, height: 190))
        view.backType = { type in
            EWToast.showCenterWithText(text: type)
        }
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawMyView()
    }
    private func drawMyView() {
        self.view.addSubview(animationView)
    }

}

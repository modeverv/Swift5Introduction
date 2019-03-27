//
//  ViewController.swift
//  Swift5Introduction
//
//  Created by seijiro on 2019/03/26.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import PGEZTransition

class IntroFirstController: UIViewController {

  @IBOutlet var transformView: PGTransformView!
  
  @IBOutlet var title1: PGTransformLabel!

  @IBOutlet var title2: PGTransformLabel!

  @IBOutlet var iamge1: PGTransformImageView!

  @IBOutlet var nextButton: UIButton!

  private var transition:PGTransformPushTransition!

  private lazy var nextVc:IntroSecondController = {
    var a = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntroSecondController") as! IntroSecondController
    return a
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.transitionSetup()
  }


  @IBAction func onNext(_ sender: Any) {
    self.transition.showTransformViewController()
  }
}

extension IntroFirstController {


  func transitionSetup() {
    self.transition = PGTransformPushTransition.init(target: self,showing: self.nextVc)

    transformView.setStartAlpha(0.0, start: 0.0, duration: 1.0)
    .setEndAlpha(0.0, start: 0.0, duration: 1.0)

    iamge1
    .setStartTransform(.rateX(1.0), start: 0.0, duration: 1.0)
    .setStartAlpha(1.0, start: 0.0, duration: 1.0)
    .setEndTransform(.rateX(-1.0), start: 0.0, duration: 1.0)
    .setEndAlpha(1.0, start: 0.0, duration: 1.0)

    title1
      .setStartTransform(.rateX(0.3), start: 0.0, duration: 1.0)
      .setStartAlpha(1.0, start: 0.0, duration: 1.0)
      .setEndTransform(.zero, start: 0.0, duration: 1.0)
      .setEndAlpha(1.0, start: 0.0, duration: 0.3)

    title2
      .setStartTransform(.rateX(0.5), start: 0.0, duration: 1.0)
      .setStartAlpha(1.0, start: 0.0, duration: 1.0)
      .setEndTransform(.zero, start: 0.0, duration: 1.0)
      .setEndAlpha(1.0, start: 0.0, duration: 0.3)

  }
}


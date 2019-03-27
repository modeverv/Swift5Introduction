//
//  IntroThirdController.swift
//  Swift5Introduction
//
//  Created by seijiro on 2019/03/27.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import PGEZTransition

class IntroThirdController: UIViewController {

  @IBOutlet var transformView: PGTransformView!
  @IBOutlet var title1: PGTransformLabel!

  @IBOutlet var title2: PGTransformLabel!

  @IBOutlet var image1: PGTransformImageView!

  @IBOutlet var nextButton: UIButton!

  private var transition:PGTransformPushTransition!

  private lazy var alert:UIAlertController = {
    let alert = UIAlertController.init(title: nil, message: "始めよう", preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
    return alert
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.transitionSetup()
  }


  @IBAction func next(_ sender: Any) {
    self.present(self.alert, animated: true, completion: nil)
  }

  @IBAction func back(_ sender: Any) {
    //self.dismiss(animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)

  }
}

extension IntroThirdController {


  func transitionSetup() {

    transformView.setStartAlpha(0.0, start: 0.0, duration: 1.0)
      .setEndAlpha(0.0, start: 0.0, duration: 1.0)

    image1
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

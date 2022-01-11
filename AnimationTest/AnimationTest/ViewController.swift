//
//  ViewController.swift
//  AnimationTest
//
//  Created by 안현주 on 2022/01/11.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var greenTestView: UIView!
  
  
  @IBOutlet weak var viewTop: NSLayoutConstraint!
  @IBOutlet weak var viewLeft: NSLayoutConstraint!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func animationBTn(_ sender: Any) {
    
    viewTop.constant = 100
    viewLeft.constant = 200
    
    UIView.animate(withDuration: 4,
                   delay: 1,
                   options: [.curveEaseInOut]) {
      //뷰를 강제로 그리게 하는거
      //중요 중요...!
      self.view.layoutIfNeeded()
      
      self.greenTestView.alpha = 0.3
      //alpha는 투명도를 뜻한다./... 기본 값은 1,
    } completion: { _ in
      
    }

    
    //병렬적인 애니 사용할때 이렇게 사용....!
    UIView.animateKeyframes(withDuration: 10, delay: 0, options: .calculationModeLinear) {
      
      // 상대적인 값을 사용
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
      }
      
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
      }
      
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
      }
      
    } completion: { _ in
       
    }

  }
  
}


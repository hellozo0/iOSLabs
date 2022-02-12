//
//  ViewController.swift
//  Data_Closure
//
//  Created by 안현주 on 2022/02/13.
//

import UIKit

class FirstVC: UIViewController {

  @IBOutlet weak var dataLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func nextBtnClicked(_ sender: Any) {
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {return}
    
    //1. SecondVC로 화면전환을 하기 이전에 해당 연결통로에서 데이터가 들어오면 어떻게 처리할지 정의하기
    nextVC.completionHandler = {text in
      self.dataLabel.text = text
    }
    
    self.navigationController!.pushViewController(nextVC, animated: true)
  }
  
}


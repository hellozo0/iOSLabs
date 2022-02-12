//
//  ViewController.swift
//  Data_Delegate
//
//  Created by 안현주 on 2022/02/12.
//

import UIKit

//1. SampleProtocol 채택
class FirstVC: UIViewController, SampleProtocol {
  
  @IBOutlet weak var dataLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  //2. protocol의 구현부 작성
  func dataSend(data: String) {
    dataLabel.text = data
  }
  
  @IBAction func nextBtnClicked(_ sender: Any) {
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {return}
    
    //3. SecondVC에서 선언해둔 delegate가 self. 즉 대신해서 처리할 부분이 FirstVC라는 것을 아래의 구문을 통해 선언
    nextVC.delegate = self
    
    self.navigationController?.pushViewController(nextVC, animated: true)
  }
  
}


//
//  SecondVC.swift
//  Data_Closure
//
//  Created by 안현주 on 2022/02/13.
//

import UIKit

class SecondVC: UIViewController {

  @IBOutlet weak var dataTextField: UITextField!
  
  //1. String을 넘겨주는 연결통로
  var completionHandler: ((String) -> ())?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  @IBAction func backBtnClicked(_ sender: Any) {
    //2. 연결통로에 데이터 넣고 전달하기
    completionHandler?(self.dataTextField.text ?? "")
    self.navigationController?.popViewController(animated: true)
  }
}

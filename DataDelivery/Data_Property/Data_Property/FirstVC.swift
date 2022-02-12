//
//  ViewController.swift
//  Data_Property
//
//  Created by 안현주 on 2022/02/12.
//

import UIKit

class FirstVC : UIViewController {

  @IBOutlet weak var dataTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func touchUpToSendData(_ sender: Any) {
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {return}
    nextVC.message = dataTextField.text
    nextVC.modalPresentationStyle = .fullScreen
    self.present(nextVC, animated: true, completion: nil)
  }
  
}


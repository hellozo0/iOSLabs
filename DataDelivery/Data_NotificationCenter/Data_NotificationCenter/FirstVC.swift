//
//  ViewController.swift
//  Data_NotificationCenter
//
//  Created by 안현주 on 2022/02/13.
//

import UIKit

class FirstVC: UIViewController {

  @IBOutlet weak var dataLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    addNotiObserver()
  }

  @IBAction func nextBtnClicked(_ sender: Any) {
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {return}
    self.navigationController!.pushViewController(nextVC, animated: true)

  }
  
  private func addNotiObserver(){
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(BtnClicked),
                                           name: NSNotification.Name("notiData"),
                                           object: nil)
  }
  
  @objc func BtnClicked(notification : NSNotification){
    if let text = notification.object as? String{
      dataLabel.text = text
    }
  }
  
}


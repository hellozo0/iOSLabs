//
//  ViewController.swift
//  TestCarousel
//
//  Created by 안현주 on 2021/11/20.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var carouselCV: UICollectionView!
  
  var carouselList:[CarouselDataModel] = []
  
  override func viewDidLoad() {
    initData()
    registerXib()
    makeDelegate()
    addCollectionView()
  }
  
  
  func addCollectionView(){
    
    let layout = CarouselLayout()
    
    // 현재 페이지의 크기 비율을 지정, 피그마 참고했습니다.
    let centerItemWidthScale: CGFloat = 327/375
    let centerItemHeightScale: CGFloat = 1
    
    layout.itemSize = CGSize(width: carouselCV.frame.size.width*centerItemWidthScale, height: carouselCV.frame.size.height*centerItemHeightScale)
    
    layout.sideItemScale = 464/520
    layout.spacing = 12
    layout.sideItemAlpha = 0.4
    
    carouselCV.collectionViewLayout = layout
  }
  
  func makeDelegate() {
//    carouselCV.delegate = self
    carouselCV.dataSource = self
  }
  
  func registerXib() {
    let xibName = UINib(nibName: CarouselCVC.identifier, bundle: nil)
    carouselCV.register(xibName, forCellWithReuseIdentifier: CarouselCVC.identifier)
  }
  
  func initData(){
    carouselList.append(contentsOf: [
      CarouselDataModel(ImageName: "grey"),
      CarouselDataModel(ImageName: "red"),
      CarouselDataModel(ImageName: "yellow"),
      CarouselDataModel(ImageName: "green"),
      CarouselDataModel(ImageName: "blue")
    ])
  }
  
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  //indexPath에 어떤 cell 데이터를 넣을 지 결정하는 메소드
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCVC.identifier, for: indexPath) as? CarouselCVC else {return UICollectionViewCell()}
    
    cell.setData(appData: carouselList[indexPath.row])
    return cell
  }
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let screenWidth = UIScreen.main.bounds.width
//    let cellWidth = screenWidth
//    let cellHeight = cellWidth * (200/375)
//    return CGSize(width: cellWidth, height: cellHeight)
//
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//    UIEdgeInsets.zero
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    12
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    12
//  }
//}







//--- 여기는 예전에 쓴 코드---//
//    @IBOutlet weak var carouselCV: UICollectionView!{
//        didSet {
//            let collectionViewLayout = CarouselLayout()
//
//
//            carouselCV.delegate = self
//            carouselCV.dataSource = self
//            carouselCV.collectionViewLayout = collectionViewLayout
//            carouselCV.backgroundColor = .clear
//            carouselCV.alpha = 0
//
//            carouselCV.contentInsetAdjustmentBehavior = .never
//            let cellWidth: CGFloat = floor(screenSize.width * (263/375))
//            let insetX = (carouselCV.bounds.width - cellWidth) / 2.0
//
//            carouselCV.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
//            carouselCV.decelerationRate = .normal
//
//                }
//            }
//
//
//    var carouselList:[CarouselDataModel] = []
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initData()
//        registerXib()
//        makeDelegate()
//
////        let flowLayout: CarouselLayout  // 이 타입의
////            flowLayout = CarouselLayout()  // 인스턴스 생성
////
////            self.carouselCV.collectionViewLayout = flowLayout
//    }
//
//    func makeDelegate() {
////        carouselCV.delegate = self
////        carouselCV.dataSource = self
//    }
//
//    func registerXib() {
//        let xibName = UINib(nibName: CarouselCVC.identifier, bundle: nil)
//        carouselCV.register(xibName, forCellWithReuseIdentifier: CarouselCVC.identifier)
//    }
//
//    func initData(){
//        carouselList.append(contentsOf: [
//            CarouselDataModel(ImageName: "grey"),
//            CarouselDataModel(ImageName: "red"),
//            CarouselDataModel(ImageName: "yellow"),
//            CarouselDataModel(ImageName: "green"),
//            CarouselDataModel(ImageName: "blue")
//        ])
//    }
//
//    //delegate 등록 해주기..!
//}
//
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    //indexPath에 어떤 cell 데이터를 넣을 지 결정하는 메소드
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCVC.identifier, for: indexPath) as? CarouselCVC else {return UICollectionViewCell()}
//
//        cell.setData(appData: carouselList[indexPath.row])
//        return cell
//    }
//}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let screenWidth = UIScreen.main.bounds.width
////        let cellWidth = screenWidth
////        let cellHeight = cellWidth * (200/375)
////        return CGSize(width: cellWidth, height: cellHeight)
//        return CGSize(width: 375, height: 200)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets.zero
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        0
//    }
//}

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
        super.viewDidLoad()
        initData()
        registerXib()
        makeDelegate()
        
        let flowLayout: CarouselLayout  // 이 타입의
            flowLayout = CarouselLayout()  // 인스턴스 생성
            
            self.carouselCV.collectionViewLayout = flowLayout
    }
    
    func makeDelegate() {
        carouselCV.delegate = self
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
    
    //delegate 등록 해주기..!


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

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let screenWidth = UIScreen.main.bounds.width
//        let cellWidth = screenWidth
//        let cellHeight = cellWidth * (200/375)
//        return CGSize(width: cellWidth, height: cellHeight)
        return CGSize(width: 375, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets.zero
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

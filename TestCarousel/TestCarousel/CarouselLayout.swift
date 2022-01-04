//
//  CarouselLayout.swift
//  TestCarousel
//
//  Created by 안현주 on 2021/11/20.
//

// 사용자가 컬렉션 뷰를 스크롤할 때 컬렉션 뷰의 가운데 축을 중심으로 cell들이 offset 된 거리의 만큼을 비율 값으로 계산하여 스케일 값과 투명도를 조정하는 겁니다.
import UIKit

class CarouselLayout: UICollectionViewFlowLayout {
    private var isInit: Bool = false
    
    override func prepare() {
//        super.prepare()
        guard !isInit else { return }
        
        guard let collectionView = self.collectionView else { return }
        
        let collectionViewSize = collectionView.bounds
      self.scrollDirection = .horizontal
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width * (263/375)
        let height = width * (362/263)
        itemSize = CGSize(width: width, height: height)
        
        let xInset = (collectionViewSize.width-itemSize.width) / 2
        self.sectionInset = UIEdgeInsets(top: 0, left: xInset - 100, bottom: 0, right: xInset)
        
        scrollDirection = .horizontal
        
//        minimumLineSpacing = 10 - (itemSize.width - itemSize.width*0.7)/2
        
        isInit = true
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let superAttributes = super.layoutAttributesForElements(in: rect)
        
        superAttributes?.forEach { attributes in
            guard let collectionView = self.collectionView else { return }
            
            let collectionViewCenter = collectionView.frame.size.width / 2
            let offsetX = collectionView.contentOffset.x
            let center = attributes.center.x - offsetX
            
            let maxDis = self.itemSize.width + self.minimumLineSpacing
            let dis = min(abs(collectionViewCenter-center), maxDis)
            
            let ratio = (maxDis - dis)/maxDis
            let scale = ratio * (1-0.7) + 0.7
            
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
        return superAttributes
   }
}





//-------------

//import UIKit
//
//class CarouselLayout: UICollectionViewFlowLayout {
//
//    public var sideItemScale: CGFloat = 0.8
//    public var sideItemAlpha: CGFloat = 0.8
//    public var spacing: CGFloat = 10
//
//    public var isPagingEnabled: Bool = false
//
//    private var isSetup: Bool = false
//
//
//    //처음 컬렉션 뷰가 나타날 때 호출되거나 레이아웃을 명시적 혹은 암묵적으로 무효화했을 때 호출
//    override public func prepare() {
//        super.prepare()
//        if isSetup == false {
//            setupLayout()
//            isSetup = true
//        }
//    }
//
//    private func setupLayout() {
//        guard let collectionView = self.collectionView else {return}
//
//        let collectionViewSize = collectionView.bounds.size
//
//        //
//        let xInset = (collectionViewSize.width - self.itemSize.width) / 2
//        let yInset = (collectionViewSize.height - self.itemSize.height) / 2
//
//        //섹션 인셋
//        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
//
//        let itemWidth = self.itemSize.width
//
//        let scaledItemOffset =  (itemWidth - itemWidth*self.sideItemScale) / 2
//        self.minimumLineSpacing = spacing - scaledItemOffset
//
//        self.scrollDirection = .horizontal
//    }
//
//
//    //레이아웃 객체에 레이아웃 업데이트가 필요한지 요청하는 메서드로 레이아웃 변화가 필요할 경우 true를 반환하고 그렇지 않을 경우 false를 반환하면 됩니다. -> 기본 값은 false로, 우리가 true로 반환해 주지 않으면 prepare() 메서드는 처음 딱 한 번만 호출됩니다. 우리는 매번 레이아웃 업데이트가 필요하기에 true로 설정!
//    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
//
//
//    //모든 셀과 뷰에 대한 레이아웃 속성을  UICollectionViewLayoutAttributes 배열로 반환합니다.
//    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        guard let superAttributes = super.layoutAttributesForElements(in: rect),
//            let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
//            else { return nil }
//
//        return attributes.map({ self.transformLayoutAttributes(attributes: $0) })
//    }
//
//
//    private func transformLayoutAttributes(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//
//        guard let collectionView = self.collectionView else {return attributes}
//
//        let collectionCenter = collectionView.frame.size.width / 2
//        let contentOffset = collectionView.contentOffset.x
//        let center = attributes.center.x - contentOffset
//
//        let maxDistance = self.itemSize.width + self.minimumLineSpacing
//        let distance = min(abs(collectionCenter - center), maxDistance)
//
//        let ratio = (maxDistance - distance)/maxDistance
//
//        let alpha = ratio * (1 - self.sideItemAlpha) + self.sideItemAlpha
//        let scale = ratio * (1 - self.sideItemScale) + self.sideItemScale
//
//        attributes.alpha = alpha
//
//        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
//        let dist = attributes.frame.midX - visibleRect.midX
//        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
//        transform = CATransform3DTranslate(transform, 0, 0, -abs(dist/1000))
//        attributes.transform3D = transform
//
//        return attributes
//    }
//}

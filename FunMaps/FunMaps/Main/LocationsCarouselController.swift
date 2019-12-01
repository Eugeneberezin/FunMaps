//
//  LocationsCarouselController.swift
//  FunMaps
//
//  Created by Eugene Berezin on 12/1/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit
import LBTATools

class LocationCell: LBTAListCell<String> {
    override func setupViews() {
        backgroundColor = .red
        
        setupShadow(opacity: 0.2, radius: 5, offset: .zero, color: .black)
        layer.cornerRadius = 5
        clipsToBounds = false
    }
}

class LocationsCarouselController: LBTAListController<LocationCell, String>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.clipsToBounds = false
        collectionView.backgroundColor = .clear
        
        self.items = ["1", "2", "3"]
    }
}

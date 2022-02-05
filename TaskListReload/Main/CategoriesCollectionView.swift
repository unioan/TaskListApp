//
//  CategoriesCollectionView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 02.10.2021.
//

import UIKit

class CategoriesCollectionView: UICollectionView {


    init() {
        super.init(frame: CGRect(), collectionViewLayout: LayoutManager.createLayuot())
        register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.cellId) 
        
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

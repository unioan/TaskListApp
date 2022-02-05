//
//  LayoutManager.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 02.10.2021.
//

import UIKit

class LayoutManager {
    
    static func createLayuot() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection in
            LayoutManager.createSection()
        }
        return layout
    }
    
    static func createSection() -> NSCollectionLayoutSection {
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.46))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 10, bottom: 0, trailing: 10) 
        section.interGroupSpacing = 8
        
        return section
    }

}

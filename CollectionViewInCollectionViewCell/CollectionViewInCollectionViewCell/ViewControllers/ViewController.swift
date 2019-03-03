//
//  ViewController.swift
//  CollectionViewInCollectionViewCell
//
//  Created by Anish on 3/3/19.
//  Copyright © 2019 Anish Kodeboyina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let firstCellIdentifier = "firstCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellIdentifier, for: indexPath) as! FirstCollectionViewCell
        cell.configureCollectionView()
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 8
        return cell
    }
}


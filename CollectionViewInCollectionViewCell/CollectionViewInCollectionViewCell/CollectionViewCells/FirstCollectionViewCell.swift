//
//  FirstCollectionViewCell.swift
//  CollectionViewInCollectionViewCell
//
//  Created by Anish on 3/3/19.
//  Copyright © 2019 Anish Kodeboyina. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    let secondCellIdentifier = "secondCell"
    let data = ["Home", "Call", "Security", "Dice", "Chat"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: secondCellIdentifier)
        collectionView.reloadData()
    }
}

extension FirstCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCellIdentifier, for: indexPath) as! SecondCollectionViewCell
        cell.imageView.image = UIImage(named: data[indexPath.row])
        cell.label.text = data[indexPath.row]
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        return cell
    }
}

extension FirstCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}

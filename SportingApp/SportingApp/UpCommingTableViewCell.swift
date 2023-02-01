//
//  UpCommingTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class UpCommingTableViewCell: UITableViewCell {

    @IBOutlet weak var upcomingColletion: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingColletion.delegate = self
        upcomingColletion.dataSource = self
        let nib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        upcomingColletion.register(nib, forCellWithReuseIdentifier: "cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UpCommingTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! HorizontalCollectionViewCell
        cell.eventNameLabel.text = "Hello"

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:100, height: 100)
        }
    
}

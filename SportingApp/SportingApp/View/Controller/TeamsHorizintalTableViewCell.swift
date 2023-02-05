//
//  TeamsHorizintalTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class TeamsHorizintalTableViewCell: UITableViewCell {
    var table = LeguesDetailsTableViewController()
  //  var collec = 
    var computedArray: [EventDetails]=[]
    @IBOutlet weak var teamsCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        teamsCollection.delegate = self
        teamsCollection.dataSource = self
      let nib = UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
        teamsCollection.register(nib, forCellWithReuseIdentifier: "cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TeamsHorizintalTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! TeamsCollectionViewCell
        cell.teamImg.image = UIImage(named: "burger")
//        cell.teamImg.layer.cornerRadius = cell.teamImg.frame.width/2
//        cell.teamImg.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:100, height: 100)
        }
    
}

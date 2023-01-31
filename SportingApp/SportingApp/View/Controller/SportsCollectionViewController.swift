//
//  SportsCollectionViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit

//private let reuseIdentifier = "Cell"

class SportsCollectionViewController: UICollectionViewController {

    var arr = ["Mariam","Eman","x","z","g","y","t"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "SportsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SportsCollectionViewCell
        
        cell!.sportImage.image = UIImage(named: "load")
        cell!.sportTitle.text = arr[indexPath.row]

        return cell!
    }
    
    
    
}

extension SportsCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            let height = UIScreen.main.bounds.width/2
            let width = UIScreen.main.bounds.width/2
            return CGSize(width: width, height: height)
        }
}

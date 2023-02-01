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

//        let nib = UINib(nibName: "SportsCollectionViewCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SportCollectionViewCell
        
        cell!.imageVIew.image = UIImage(named: "burger")
        //cell!.sportTitle.text = arr[indexPath.row]

        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesTableViewController : LeaguesTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "leaguesTVC") as! LeaguesTableViewController
        self.navigationController?.pushViewController(leaguesTableViewController, animated: true)
    }
    
}

extension SportsCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
        let w = collectionView.frame.size.width/2-30
        //let h = collectionView.frame.size.height/4+70
        let h = collectionView.frame.size.width/2-30
        return CGSize(width: w, height: h)
        }*/
    
}

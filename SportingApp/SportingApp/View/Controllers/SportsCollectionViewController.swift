//
//  SportsCollectionViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import Alamofire
import SnackBar_swift

class SportsCollectionViewController: UICollectionViewController {
    
    var sports = getSports()
    static var endpoint : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SportCollectionViewCell
        
        cell?.cellConfig(sport: sports[indexPath.row])
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let leaguesTableViewController : LeaguesTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "leaguesTVC") as! LeaguesTableViewController
        
        if indexPath.row >= 4{
            SnackBar.make(in: self.view, message: "This sport will be add to application soon", duration: .lengthLong).setAction(with: "Close", action: nil).show()
        }
        else{
            SportsCollectionViewController.endpoint = getSportEndPoint(endpoint: sports[indexPath.row].endPoint ?? " ")
            self.navigationController?.pushViewController(leaguesTableViewController, animated: true)
        }
    }
    
}

extension SportsCollectionViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: self.view.frame.width*0.499, height: self.view.frame.height*0.29)
        }
    
    static func getEndPoint() -> String{
        return SportsCollectionViewController.endpoint
    }
}



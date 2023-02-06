//
//  SportsCollectionViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import Alamofire

class SportsCollectionViewController: UICollectionViewController {
    
    var sports = getSports()
    
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
        
        cell!.imageVIew.image = UIImage(named: sports[indexPath.row].image!)
        cell!.sportLabel.text = sports[indexPath.row].name

        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesTableViewController : LeaguesTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "leaguesTVC") as! LeaguesTableViewController
        
        leaguesTableViewController.endpoint = getSportEndPoint(endpoint: sports[indexPath.row].endPoint ?? "")
        self.navigationController?.pushViewController(leaguesTableViewController, animated: true)
    }
    
}

extension SportsCollectionViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
        let w = collectionView.frame.size.width/2-30
        let h = collectionView.frame.size.width/2-30
        return CGSize(width: w, height: h)
        }
    
}

func getSportEndPoint(endpoint: String) -> (String){
    var endpointTobeReturned : String!
    switch endpoint{
    case "football":
        endpointTobeReturned = "football"
    case "basketball":
        endpointTobeReturned = "basketball"
    case "cricket":
        endpointTobeReturned = "cricket"
    default:
        endpointTobeReturned = ""
    }
    return endpointTobeReturned
}

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
    
    var imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    var sports = getSports()
    static var endpoint : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(imageView)
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        imageView.center = view.center
//        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
//            self.animate()
//        }
//        DispatchQueue.main.as(execute: .now()+3) {
//            self.animate()
//        }
   // }
    
//    private func animate(){
//        UIView.animate(withDuration: 7, animations: {
//            let size = self.view.frame.size.width * 3
//            let diffx = size - self.view.frame.size.width
//            let diffy = self.view.frame.size.height - size
//
//            self.imageView.frame = CGRect(x: -(diffx/2), y: (diffy/2), width: size, height: size)
//        })
//
//        UIView.animate(withDuration: 1.5, animations: {
//            self.imageView.alpha = 0
//        },completion: { done in
//            if done{
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
//                    let viewController = SportsCollectionViewController()
//                    viewController.modalTransitionStyle = .crossDissolve
//                    viewController.modalPresentationStyle = .fullScreen
//                    self.present(viewController, animated: true)
//                }
//            }
//
//        })
//
//
//    }
    
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



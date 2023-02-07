//
//  DetailsViewController.swift
//  SportingApp
//
//  Created by Eman on 07/02/2023.
//

import UIKit

class DetailsViewController: UIViewController{

    

    @IBOutlet weak var UpComming: UICollectionView!
    @IBOutlet weak var latest: UICollectionView!
    @IBOutlet weak var teams: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UpComming.dataSource = self
        UpComming.delegate = self
        latest.delegate = self
        latest.dataSource = self
        teams.delegate = self
        teams.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailsViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
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

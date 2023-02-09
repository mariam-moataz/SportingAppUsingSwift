//
//  PlayerdetailsViewController.swift
//  SportingApp
//
//  Created by Eman on 09/02/2023.
//

import UIKit

class PlayerdetailsViewController: UIViewController {

    @IBOutlet weak var playerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerImage.layer.cornerRadius = playerImage.frame.width/2
        playerImage.clipsToBounds = true
        playerImage.image = UIImage(named: "load")

        // Do any additional setup after loading the view.
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

//
//  LaunchScreenAnimationViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 14/02/2023.
//

import UIKit

class LaunchScreenAnimationViewController: UIViewController {
    
    var imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 283, height: 192))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.animate()
        }
    }
    
    private func animate(){
        UIView.animate(withDuration: 7, animations: {
            let size = self.view.frame.size.width * 3
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffx/2), y: (diffy/2), width: size, height: size)
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        },completion: { done in
            if done{
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tabBar")
                    //viewController.modalTransitionStyle = .crossDissolve
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
                }
            }
            
        })
        
        
    }

}

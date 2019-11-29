//
//  ViewController.swift
//  SplashScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let logoImage = UIImageView(image: UIImage(named: "app_logo"))
    private let splashView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splashView.backgroundColor = UIColor.white
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
       
        splashView.contentMode = .scaleAspectFit
        splashView.addSubview(logoImage)
        logoImage.frame = CGRect(x: (splashView.frame.width / 2) - 50, y: (splashView.frame.height / 2) - 50, width: 100, height: 100)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scaleUpAnimation()
    }


    private func scaleUpAnimation() {
        UIView.animate(withDuration: 0.75, delay: 0.1, options: .curveEaseInOut, animations: {
            self.logoImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { (success) in
            self.removeSplashView()
        }
    }
    
    private func removeSplashView() {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            self.logoImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { (success) in
            self.splashView.removeFromSuperview()
        })
        
    }

}


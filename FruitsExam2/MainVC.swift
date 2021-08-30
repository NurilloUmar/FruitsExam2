//
//  MainVC.swift
//  FruitsExam2
//
//  Created by apple on 26/07/21.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func playPrseed(_ sender: Any) {
        let vc = MainTab(nibName: "MainTab", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
}

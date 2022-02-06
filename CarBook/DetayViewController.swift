//
//  DetayViewController.swift
//  CarBook
//
//  Created by Hasan Atık on 5.02.2022.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
   
    var SecilenArac : Cars?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = SecilenArac?.Aracresmi
        label.text = SecilenArac?.Aracismi
        

    }
    


}

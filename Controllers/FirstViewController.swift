//
//  ViewController.swift
//  Cocoa Chat
//
//  Created by Jamie Kim  on 8/28/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import UIKit
import CLTypingLabel
//Icons made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
//Icons made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
//<div>Icons made by <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

class FirstViewController: UIViewController {
    
    //disable navigation bar on the firstviewcontroller
    override func viewDidDisappear(_ animated: Bool) {
        //overriding 
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    //enable it back bc i want it on next screen
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = K.appName
    }


}



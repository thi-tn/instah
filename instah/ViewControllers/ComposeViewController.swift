//
//  ComposeViewController.swift
//  instah
//
//  Created by student on 9/23/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

//    @IBAction func ShareAction(_ sender: Any) {
//        self.performSegue(withIdentifier: "composeSegue", sender: nil)
//
//    }

    @IBAction func onShare(_ sender: Any) {
        self.performSegue(withIdentifier: "composeSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

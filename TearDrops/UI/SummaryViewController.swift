//
//  SummaryViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 17/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homeAction(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
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

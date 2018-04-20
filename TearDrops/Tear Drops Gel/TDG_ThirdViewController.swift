//
//  TDG_ThirdViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 12/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class TDG_ThirdViewController: UIViewController,PenviewDelegate {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var content: UIImageView!
    
    @IBAction func homeAction(_ sender: Any) {
        moveToPreviousViewController(currentVC: self, at: 0)
    }
    @IBAction func editAction(_ sender: Any) {
        disbaleAllGestures(status: false)
        let penView = PenView.instanceFromNib()
        penView.initiatePenView()
        penView.delegate = self
        penView.frame = CGRect.init(x: 0, y: 68, width: self.view.bounds.width, height: self.view.bounds.height - 68)
        penView.backgroundColor = UIColor.clear
        self.view.addSubview(penView)
        
    }
    func didViewClosed(){
        disbaleAllGestures(status: true)
    }
    @IBAction func referenceAction(_ sender: Any) {
        let popImage = UIImage(named: "tdg_popup_new")
        let buttonImage = UIImage(named: "tdg_close")
        presentReferenceView(currentVC: self, image: popImage!, with: buttonImage!)
    }
    
    func disbaleAllGestures(status:Bool){
        for recognizer in self.view.gestureRecognizers!{
            recognizer.isEnabled = status
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(moveToPrevious(gestureRecg:)) )
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNext(gestureRecg:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
    }

    override func viewWillAppear(_ animated: Bool) {
        googleAnalyticsTrackingWith(trackingName: "Tear Drops Computer Vision Syndrome DED Symptoms")
        self.content.alpha = 0
        
        let rect : CGRect = CGRect.init(x: self.view.center.x, y: 113, width: 0, height: 0)
        let prevRect = self.logo.frame
        self.logo.frame = rect
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseIn, animations: {
            self.logo.frame = prevRect
        }) { (finished:Bool) in
            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                self.content.alpha = 1
            }) { (finished:Bool) in
                
            }
        }
    }
    
    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
        if GlobalClass.shared.selectionArray.count > 1{
            GlobalClass.shared.selectionArray.remove(at: 0)
            let nextVC = GlobalClass.shared.selectionArray[0]
            moveToViewController(nextVC: nextVC,for: self)
        }
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
//        self.navigationController?.popViewController(animated: true)
        moveToPreviousViewController(currentVC: self, at: 2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
        let newViewController = setupStoryBoard(storyBoardName: "TearDropsGel").instantiateViewController(withIdentifier: "TDG_FirstViewController") as! TDG_FirstViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func secondAction(_ sender: UIButton) {
        //        performSegue(withIdentifier: "td_page2", sender: nil)
       // moveToPreviousViewController(currentVC: self, at: 2)
        let newViewController = setupStoryBoard(storyBoardName: "TearDropsGel").instantiateViewController(withIdentifier: "TDG_SecondViewController") as! TDG_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func thirdAction(_ sender: UIButton) {
      
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

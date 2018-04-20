//
//  GTears_FirstViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 13/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class GTears_FirstViewController: UIViewController,PenviewDelegate {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(moveToPrevious(gestureRecg:)) )
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNext(gestureRecg:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        googleAnalyticsTrackingWith(trackingName: "Glytears Cheerful Dry Eyes Teaser")
        
        
//        self.mainImage.alpha = 0
        
     /*   UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: {
            self.mainImage.alpha = 1
        }) { (finished:Bool) in
        }*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
         Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.animateGif), userInfo: nil, repeats: false)
    }
    
    @objc func animateGif(){
        DispatchQueue.main.async {
            let jermyGif = UIImage.gifImageWithName(name: "water")
            self.mainImage.image = jermyGif
        }
    }
    
    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
        let newViewController = setupStoryBoard(storyBoardName: "GlyTears").instantiateViewController(withIdentifier: "GTears_SecondViewController") as! GTears_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    
    func moveToNextViewController(){
        let newViewController = setupStoryBoard(storyBoardName: "GlyTears").instantiateViewController(withIdentifier: "GTears_SecondViewController") as! GTears_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    
//    @IBAction func firstAction(_ sender: UIButton) {
//    }
//    @IBAction func secondAction(_ sender: UIButton) {
//        moveToNextViewController()
//    }
//    
//    @IBAction func thirdAction(_ sender: UIButton) {
//        let newViewController = setupStoryBoard(storyBoardName: "GlyTears").instantiateViewController(withIdentifier: "GTears_ThirdViewController") as! GTears_ThirdViewController
//        moveToViewController(nextVC: newViewController,for: self)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeAction(_ sender: Any) {
       moveToHome(currentVC:self)
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
        let popImage = UIImage(named: "gly_popup_new")
        let buttonImage = UIImage(named: "gly_close")
        presentReferenceView(currentVC: self, image: popImage!, with: buttonImage!)
    }
    
    func disbaleAllGestures(status:Bool){
        for recognizer in self.view.gestureRecognizers!{
            recognizer.isEnabled = status
        }
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

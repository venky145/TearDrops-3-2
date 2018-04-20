//
//  MDEX_FirstViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 14/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class MDEX_FirstViewController: UIViewController,PenviewDelegate {

    @IBOutlet weak var contentImage: UIImageView!
    
    
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
        
        self.contentImage.alpha = 1
        
//        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: {
////            DispatchQueue.main.async {
//                self.contentImage.alpha = 1
////            }
//
//        }) { (finished:Bool) in
//        }
    }
    
    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
        moveToNextViewController()
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        moveToPrevious()
    }
    
    func moveToNextViewController(){
        let newViewController = setupStoryBoard(storyBoardName: "Milflodex").instantiateViewController(withIdentifier: "MDEX_SecondViewController") as! MDEX_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    func moveToPrevious(){
        moveToPreviousViewController(currentVC: self, at: 1)
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
        
    }
    @IBAction func secondAction(_ sender: UIButton) {
        
        moveToNextViewController()
    }
    @IBAction func thirdAction(_ sender: UIButton) {
        //        let newViewController = setupStoryBoard(storyBoardName: "Milflox").instantiateViewController(withIdentifier: "MG_ThirdViewController") as! MG_ThirdViewController
        //        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func fourthAction(_ sender: UIButton) {
        
        let newViewController = setupStoryBoard(storyBoardName: "Milflodex").instantiateViewController(withIdentifier: "MDEX_FourthViewController") as! MDEX_FourthViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    
    @IBAction func fifthAction(_ sender: UIButton) {
        let newViewController = setupStoryBoard(storyBoardName: "Milflodex").instantiateViewController(withIdentifier: "MDEX_FifthViewController") as! MDEX_FifthViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    
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
        let popImage = UIImage(named: "md_popup_new")
        let buttonImage = UIImage(named: "md_close")
        presentReferenceView(currentVC: self, image: popImage!, with: buttonImage!)
    }
    
    func disbaleAllGestures(status:Bool){
        for recognizer in self.view.gestureRecognizers!{
            recognizer.isEnabled = status
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

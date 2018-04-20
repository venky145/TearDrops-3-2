//
//  TDG_FirstViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 12/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit
import AVKit
class TDG_FirstViewController: UIViewController,PenviewDelegate {
let playerController = AVPlayerViewController()
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
        
        let newViewController = setupStoryBoard(storyBoardName: "TearDropsGel").instantiateViewController(withIdentifier: "TDG_SecondViewController") as! TDG_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
//        self.navigationController?.popViewController(animated: true)
        moveToPreviousViewController(currentVC: self, at: 0)
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
    @IBAction func videopop(_ sender: UIButton) {
        playVideo(videoUrl:"teardropsgel_in")
    }
    func playVideo(videoUrl:String){
        guard let path = Bundle.main.path(forResource: videoUrl, ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        //        playerController.delegate = self
        //        self.view.addSubview(playerController.view)
        //        playerController.view.frame = self.view.bounds
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
        self.playerController.dismiss(animated: true)
        
    }
    @IBAction func firstAction(_ sender: UIButton) {
    }
    @IBAction func secondAction(_ sender: UIButton) {
        //        performSegue(withIdentifier: "td_page2", sender: nil)
        let newViewController = setupStoryBoard(storyBoardName: "TearDropsGel").instantiateViewController(withIdentifier: "TDG_SecondViewController") as! TDG_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func thirdAction(_ sender: UIButton) {
        let newViewController = setupStoryBoard(storyBoardName: "TearDropsGel").instantiateViewController(withIdentifier: "TDG_ThirdViewController") as! TDG_ThirdViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
}

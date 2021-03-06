//
//  GEye_VideoViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 14/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit
import AVKit

class GEye_VideoViewController: UIViewController {
let playerController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(moveToPrevious(gestureRecg:)) )
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNext(gestureRecg:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        playVideo(videoUrl:"Gloeye")
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
        playerController.showsPlaybackControls = false
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
        self.playerController.dismiss(animated: true)
        let newViewController = setupStoryBoard(storyBoardName: "Gloeye").instantiateViewController(withIdentifier: "GEye_FirstViewController") as! GEye_FirstViewController
        moveToViewController(nextVC: newViewController,for: self)
        // performSegue(withIdentifier: "GEye_FirstViewController", sender: nil)
        // performSegue(withIdentifier: "GEye_FirstViewController", sender: nil)
        // moveToViewController(nextVC: newViewController,for: self)
        
        //
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    
    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
        let newViewController = setupStoryBoard(storyBoardName: "Gloeye").instantiateViewController(withIdentifier: "GEye_FirstViewController") as! GEye_FirstViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
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

//
//  ViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 10/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit
import AVKit
import ImageIO

public var isSequence = false
public var currentStackIndex = 0
public var teardropvid = 0
public var normovid = 0


class ViewController: UIViewController {
    
    let vcHandler = GlobalClass.shared
    let playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true
    }

    func addObjectToSelected(){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        isSequence = false
        teardropvid = 0
        normovid = 0
        print(teardropvid)
    }
    
    
    @IBAction func tearDropsAction(_ sender: Any) {

        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is TD_FirstPageViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "Main").instantiateViewController(withIdentifier: "TD_FirstPageViewController") as! TD_FirstPageViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func tearDropsGelAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is TDG_FirstViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "TearDropsGel").instantiateViewController(withIdentifier: "TDG_FirstViewController") as! TDG_FirstViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func LatoprostAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is LProst_VideoViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
           let newViewController = setupStoryBoard(storyBoardName: "Latoprost").instantiateViewController(withIdentifier: "LProst_VideoViewController") as! LProst_VideoViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func latoComAction(_ sender: Any) {
        
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is LCOM_FirstViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "Latocom").instantiateViewController(withIdentifier: "LCOM_FirstViewController") as! LCOM_FirstViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func brimololAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is BRIMO_VideoViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "Brimolol").instantiateViewController(withIdentifier: "BRIMO_VideoViewController") as! BRIMO_VideoViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func brimosunLSAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is BrimoSViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "Brimosun").instantiateViewController(withIdentifier: "BrimoSViewController") as! BrimoSViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func brimosunPAction(_ sender: Any) {

        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is BrimoPViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "BrimosunP").instantiateViewController(withIdentifier: "BrimoPViewController") as! BrimoPViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func natametAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is NataViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "Natamet").instantiateViewController(withIdentifier: "NataViewController") as! NataViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func tobaFAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is TOBAFViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "TobaF").instantiateViewController(withIdentifier: "TOBAFViewController") as! TOBAFViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func tobaAction(_ sender: Any) {
       
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is TobaViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
             let newViewController = setupStoryBoard(storyBoardName: "Toba").instantiateViewController(withIdentifier: "TobaViewController") as! TobaViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func milfloxPlusAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is MPLUS_FirstViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "MilfloxPlus").instantiateViewController(withIdentifier: "MPLUS_FirstViewController") as! MPLUS_FirstViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    @IBAction func milflodexAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is MIDEX_VideoViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "Milflodex").instantiateViewController(withIdentifier: "MIDEX_VideoViewController") as! MIDEX_VideoViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    @IBAction func milfloxAction(_ sender: Any) {
       
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is MIL_VideoViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
             let newViewController = setupStoryBoard(storyBoardName: "Milflox").instantiateViewController(withIdentifier: "MIL_VideoViewController") as! MIL_VideoViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    @IBAction func megabromAction(_ sender: Any) {
       
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is MG_VideoViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
             let newViewController = setupStoryBoard(storyBoardName: "Megabrom").instantiateViewController(withIdentifier: "MG_VideoViewController") as! MG_VideoViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    @IBAction func gloEyeAction(_ sender: Any) {
        
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is GEye_VideoViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
           let newViewController = setupStoryBoard(storyBoardName: "Gloeye").instantiateViewController(withIdentifier: "GEye_VideoViewController") as! GEye_VideoViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }

    }
    @IBAction func glyTearsAction(_ sender: Any) {
        let button = sender as! UIButton
        if button.isSelected{
            button.isSelected = false
            for controller in vcHandler.selectionArray
            {
                if controller is GTears_FirstViewController
                {
                    vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                    button.backgroundColor = UIColor.clear
                }
            }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "GlyTears").instantiateViewController(withIdentifier: "GTears_FirstViewController") as! GTears_FirstViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
        
    }
    @IBAction func normoTearsAction(_ sender: Any) {
        let button = sender as! UIButton
        
        if button.isSelected{
            button.isSelected = false
                for controller in vcHandler.selectionArray
                {
                    if controller is NT_FirstViewController
                    {
                        vcHandler.selectionArray = vcHandler.selectionArray.filter{$0 != controller}
                        button.backgroundColor = UIColor.clear
                    }
                }
            
        }else{
            let newViewController = setupStoryBoard(storyBoardName: "NormoTears").instantiateViewController(withIdentifier: "NT_FirstViewController") as! NT_FirstViewController
            button.isSelected = true
            button.backgroundColor = UIColor.blue
            vcHandler.selectionArray.append(newViewController)
        }
    }
    
    @IBAction func submitAction(_ sender: Any) {
       // playVideo(videoUrl: "Division Opener")
        
        if vcHandler.selectionArray.count > 0 {
        let initialVC = vcHandler.selectionArray[0]
        moveToViewController(nextVC: initialVC,for: self)
        }
    }
    
    func playVideo(videoUrl:String){
        guard let path = Bundle.main.path(forResource: videoUrl, ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        playerController.showsPlaybackControls = false
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.playerController.dismiss(animated: true)
        isSequence = false
        let initialVC = vcHandler.selectionArray[0]
        moveToViewController(nextVC: initialVC,for: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
public func setupStoryBoard(storyBoardName:String)->UIStoryboard{
    let storyBoard: UIStoryboard = UIStoryboard(name: storyBoardName , bundle: nil)
    return storyBoard
}
//////////////////


extension UIImage {
    
    
    
    public class func gifImageWithData(data: NSData) -> UIImage? {
        
        guard let source = CGImageSourceCreateWithData(data, nil) else {
            
            print("image doesn't exist")
            
            return nil
            
        }
        
        
        
        return UIImage.animatedImageWithSource(source: source)
        
    }
    
    
    
    public class func gifImageWithURL(gifUrl:String) -> UIImage? {
        
        guard let bundleURL = NSURL(string: gifUrl)
            
            else {
                
                print("image named \"\(gifUrl)\" doesn't exist")
                
                return nil
                
        }
        
        guard let imageData = NSData(contentsOf: bundleURL as URL) else {
            
            print("image named \"\(gifUrl)\" into NSData")
            
            return nil
            
        }
        
        
        
        return gifImageWithData(data: imageData)
        
    }
    
    
    
    public class func gifImageWithName(name: String) -> UIImage? {
        
        guard let bundleURL = Bundle.main
            
            .url(forResource: name, withExtension: "gif") else {
                
                print("SwiftGif: This image named \"\(name)\" does not exist")
                
                return nil
                
        }
        
        
        
        guard let imageData = NSData(contentsOf: bundleURL) else {
            
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            
            return nil
            
        }
        
        
        
        return gifImageWithData(data: imageData)
        
    }
    
    
    
    class func delayForImageAtIndex(index: Int, source: CGImageSource!) -> Double {
        
        var delay = 0.1
        
        
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        
        let gifProperties: CFDictionary = unsafeBitCast(CFDictionaryGetValue(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()), to: CFDictionary.self)
        
        
        
        var delayObject: AnyObject = unsafeBitCast(CFDictionaryGetValue(gifProperties, Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()), to: AnyObject.self)
        
        
        
        if delayObject.doubleValue == 0 {
            
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
            
        }
        
        
        
        delay = delayObject as! Double
        
        
        
        if delay < 0.1 {
            
            delay = 0.1
            
        }
        
        
        
        return delay
        
    }
    
    
    
    class func gcdForPair(a: Int?, _ b: Int?) -> Int {
        
        var a = a
        
        var b = b
        
        if b == nil || a == nil {
            
            if b != nil {
                
                return b!
                
            } else if a != nil {
                
                return a!
                
            } else {
                
                return 0
                
            }
            
        }
        
        
        
        if a! < b! {
            
            let c = a!
            
            a = b!
            
            b = c
            
        }
        
        
        
        var rest: Int
        
        while true {
            
            rest = a! % b!
            
            
            
            if rest == 0 {
                
                return b!
                
            } else {
                
                a = b!
                
                b = rest
                
            }
            
        }
        
    }
    
    
    
    class func gcdForArray(array: Array<Int>) -> Int {
        
        if array.isEmpty {
            
            return 1
            
        }
        
        
        
        var gcd = array[0]
        
        
        
        for val in array {
            
            gcd = UIImage.gcdForPair(a: val, gcd)
            
        }
        
        
        
        return gcd
        
    }
    
    
    
    class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
        
        let count = CGImageSourceGetCount(source)
        
        var images = [CGImage]()
        
        var delays = [Int]()
        
        
        
        for i in 0..<count {
            
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                
                images.append(image)
                
            }
            
            
            
            let delaySeconds = UIImage.delayForImageAtIndex(index: Int(i), source: source)
            
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
            
        }
        
        
        
        let duration: Int = {
            
            var sum = 0
            
            
            
            for val: Int in delays {
                
                sum += val
                
            }
            
            
            
            return sum
            
        }()
        
        
        
        let gcd = gcdForArray(array: delays)
        
        var frames = [UIImage]()
        
        
        
        var frame: UIImage
        
        var frameCount: Int
        
        for i in 0..<count {
            
            frame = UIImage(cgImage: images[Int(i)])
            
            frameCount = Int(delays[Int(i)] / gcd)
            
            
            
            for _ in 0..<frameCount {
                
                frames.append(frame)
                
            }
            
        }
        
        
        
        let animation = UIImage.animatedImage(with: frames, duration: Double(duration) / 1000.0)
        
        
        
        return animation
        
    }
    
}



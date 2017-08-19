//
//  ViewController.swift
//  MindIT
//
//  Created by SATYA on 09/08/17.
//  Copyright © 2017 Builder Infotech Pvt Ltd. All rights reserved.
//

import UIKit

extension Array {
    mutating func shuffle() {
        for _ in 0..<((count>0) ? (count-1) : 0) {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}


extension UIImage {
    
    func isEqualToImage(image: UIImage) -> Bool {
        let data1: NSData = UIImagePNGRepresentation(self)! as NSData
        let data2: NSData = UIImagePNGRepresentation(image)! as NSData
        return data1.isEqual(data2)
    }
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView1: UIImageView!
     @IBOutlet weak var imageView2: UIImageView!
     @IBOutlet weak var imageView3: UIImageView!
     @IBOutlet weak var imageView4: UIImageView!
     @IBOutlet weak var imageView5: UIImageView!
     @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    @IBOutlet weak var imageView11: UIImageView!
    @IBOutlet weak var imageView12: UIImageView!
    @IBOutlet weak var imageView13: UIImageView!
    @IBOutlet weak var imageView14: UIImageView!
    @IBOutlet weak var imageView15: UIImageView!
    @IBOutlet weak var imageView16: UIImageView!
    @IBOutlet weak var imageView17: UIImageView!
    @IBOutlet weak var imageView18: UIImageView!
    @IBOutlet weak var imageView19: UIImageView!
    @IBOutlet weak var imageView20: UIImageView!
    @IBOutlet weak var imageView21: UIImageView!
    @IBOutlet weak var imageView22: UIImageView!
    @IBOutlet weak var imageView23: UIImageView!
    @IBOutlet weak var imageView24: UIImageView!
    @IBOutlet weak var imageView25: UIImageView!
     @IBOutlet weak var countDown: UILabel!
    var timerx :Timer = Timer()
    
    var firstImage:UIImageView!
    var secondImage:UIImageView!
    var selectedImage:Int = 0;
    var counter:Int = 0
    
    var imageArray:[String] = [];
    var imageArrayCopy:[String] = [];
    var imageViews:[UIImageView] = [];
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        imageArray = ["img_1.png","img_2.png","img_3.png","img_4.png","img_5.png",
                      "img_4.png","img_5.png","img_6.png","img_7.png","img_11.png",
                      "img_8.png","img_7.png","img_9.png","img_11.png","img_12.png",
                      "img_10.png","img_3.png","img_8.png","img_10.png","img_12.png",
                      "img_6.png","img_2.png","img_9.png","img_1.png","img_13.png"]
        
        
        
        //Suffel imagenames
        imageArrayCopy = imageArray;
        
        imageArrayCopy.shuffle()
        
        for imageName in imageArrayCopy{
            
            print(imageName)
        }
        
        
        imageViews = [imageView1,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,
                      imageView8, imageView9,imageView10, imageView11,imageView12,imageView13,imageView14,imageView15,imageView16,imageView17,imageView18,imageView19,imageView20,imageView21,imageView22,imageView23,imageView24,imageView25]
        
        for (index,imageViewTemp) in imageViews.enumerated() {
            
            
            imageViewTemp.image = UIImage.init(named: imageArrayCopy[index])
           
            imageViews[index].tag = index
        }
        
        
       // foldAllImages()
        
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "blue_bkgnd.png")!);
        
        
        selectedImage = 0;
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {_ in
        
        self.foldAllImages()
        })
     counter = 5
        timerx =  Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in
            self.counter = self.counter  - 1
            self.countDown.text =  "\(self.counter)"
            
            if self.countDown.text == "0" {
                self.countDown.text = ""
                self.timerx.invalidate()
            }
    
        })
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
   @IBAction func foldAllImages()
    {
        
        for (index,imageViewTemp) in imageViews.enumerated() {
            
            
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(3.0)
            UIView.setAnimationTransition(.flipFromRight, for: imageViewTemp, cache:true)
            UIView.commitAnimations()
            
            imageViewTemp.image = UIImage.init(named: "blank_card.png")!

        }
        
        
    }
    
    
    @IBAction func FlipBothCards()    {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationTransition(.flipFromRight, for: firstImage, cache:true)
        UIView.commitAnimations()
        
        firstImage.image = UIImage.init(named: "blank_card.png")!
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationTransition(.flipFromRight, for: secondImage, cache:true)
        UIView.commitAnimations()
        
        secondImage.image = UIImage.init(named: "blank_card.png")!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        var touch :UITouch = touches.first as UITouch!
        
    
        
       
        if (touch.view?.tag == 9999) {
            
            return
        }
        
        var selectedTag:Int = (touch.view?.tag)!
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationTransition(.flipFromRight, for: self.imageViews[(touch.view?.tag)!], cache:true)
        UIView.commitAnimations()
        
      ///  firstImage =  self.imageViews[(touch.view?.tag)!]
        
        self.imageViews[(touch.view?.tag)!].image = UIImage.init(named: imageArrayCopy[(touch.view?.tag)!])
        
        
        
       

          if (selectedImage == 0)
          {
            selectedImage = 1
          }
            if selectedImage == 1 {
                
                
                
                firstImage =  self.imageViews[(touch.view?.tag)!]
                
                 print("Card Touched first \(selectedTag))" )
                
                selectedImage = 2
                
                
            }else if selectedImage == 2
            {
              
                
                UIView.beginAnimations(nil, context: nil)
                UIView.setAnimationDuration(1.0)
                UIView.setAnimationTransition(.flipFromLeft, for: self.imageViews[(touch.view?.tag)!], cache:true)
                UIView.commitAnimations()
                
                print("Card Touched second \(selectedTag))" )
                secondImage =  self.imageViews[(touch.view?.tag)!]
                
                
                
                if (secondImage.image?.isEqualToImage(image: firstImage.image!))!
                {
                    print("success")
                }else
                {
                    
                    print("failed")
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in self.FlipBothCards()})
                    
                    
                   
                    
                }
                
                  selectedImage = 1
            }
            
            
        }
        
    
 
    



}


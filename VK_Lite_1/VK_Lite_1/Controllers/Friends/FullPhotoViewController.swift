//
//  FullPhotoViewController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 06.05.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class FullPhotoViewController: UIViewController {
    
    let fullPhotoImageNames = ["Alexey", "Anton", "Dmitry", "Igor", "Uliana"]
    
    var currentImage = 0
    
    @IBOutlet weak var fullPhotoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if currentImage == fullPhotoImageNames.count - 1 {
                    currentImage = 0
                    
                }else{
                    currentImage += 1
                }
                fullPhotoImage.image = UIImage(named: fullPhotoImageNames[currentImage])
                
            case UISwipeGestureRecognizer.Direction.right:
                if currentImage == 0 {
                    currentImage = fullPhotoImageNames.count - 1
                }else{
                    currentImage -= 1
                }
                fullPhotoImage.image = UIImage(named: fullPhotoImageNames[currentImage])
            default:
                break
            }
        }
    }

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


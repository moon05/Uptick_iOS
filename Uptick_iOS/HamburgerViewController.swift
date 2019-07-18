//
//  HamburgerViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/17/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet var gestureScreenEdgePan: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet var viewShadow: UIView!
    
    let maxShadowViewAlpha:CGFloat = 0.9
    
    @IBOutlet var viewMenu: UIView!
    @IBOutlet var constraintMenuLeft: NSLayoutConstraint!
    @IBOutlet var constraintMenuWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraintMenuLeft.constant = -constraintMenuWidth.constant
        
        viewShadow.alpha = 0
        viewShadow.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
    }
    
    @IBAction func gestureScreenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        // retrieve the current state of the gesture
        if sender.state == UIGestureRecognizer.State.began {
            // if the user has just started dragging, make sure view for dimming effect is hidden well
            viewShadow.isHidden = false
            viewShadow.alpha = 0
        } else if (sender.state == UIGestureRecognizer.State.changed) {
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            if -constraintMenuWidth.constant + translationX > 0 {
                // viewMenu fully dragged out
                constraintMenuLeft.constant = 0
                viewShadow.alpha = maxShadowViewAlpha
            } else if translationX < 0 {
                // viewMenu fully dragged in
                constraintMenuLeft.constant = -constraintMenuWidth.constant
                viewShadow.alpha = 0
            } else {
                // viewMenu is being dragged somewhere between min and max amount
                constraintMenuLeft.constant = -constraintMenuWidth.constant + translationX
                
                let ratio = translationX / constraintMenuWidth.constant
                let alphaValue = ratio * maxShadowViewAlpha
                viewShadow.alpha = alphaValue
            }
        } else {
            // if the menu was dragged less than half of it's width, close it. Otherwise, open it.
            if constraintMenuLeft.constant < -constraintMenuWidth.constant / 2 {
                self.hideMenu()
            } else {
                self.openMenu()
            }
            
        }
    }
    
    @IBAction func gestureTap(_ sender: UITapGestureRecognizer) {
        self.hideMenu()
    }
    
    @IBAction func gesturePan(_ sender: UIPanGestureRecognizer) {
        
        // retrieve the current state of the gesture
        if sender.state == UIGestureRecognizer.State.began {
            
            // no need to do anything
        } else if sender.state == UIGestureRecognizer.State.changed {
            
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            if translationX > 0 {
                
                // viewMenu fully dragged out
                constraintMenuLeft.constant = 0
                viewShadow.alpha = maxShadowViewAlpha
            } else if translationX < -constraintMenuWidth.constant {
                
                // viewMenu fully dragged in
                constraintMenuLeft.constant = -constraintMenuWidth.constant
                viewShadow.alpha = 0
            } else {
                
                // it's being dragged somewhere between min and max amount
                constraintMenuLeft.constant = translationX
                
                let ratio = (constraintMenuWidth.constant + translationX) / constraintMenuWidth.constant
                let alphaValue = ratio * maxShadowViewAlpha
                viewShadow.alpha = alphaValue
            }
        } else {
            
            // if the drag was less than half of it's width, close it. Otherwise, open it.
            if constraintMenuLeft.constant < -constraintMenuWidth.constant / 2 {
                self.hideMenu()
            } else {
                self.openMenu()
            }
        }
    }
    
    @IBAction func buttonHamburger(_ sender: Any) {
        self.openMenu()
    }
    
    func openMenu(){
        // when menu is opened, it's left constraint should be 0
        constraintMenuLeft.constant = 0
        // view for dimming effect should also be shown
        viewShadow.isHidden = false
        // animate opening of the menu - including opacity value
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            self.viewShadow.alpha = self.maxShadowViewAlpha
        }, completion: {(complete) in
            // disable the screen edge pan gesture when menu is fully opened
            self.gestureScreenEdgePan.isEnabled = false
        })
    }
    
    func hideMenu(){
        // when menu is closed, it's left constraint should be of value that allows it to be completely hidden to the left of the screen - which is negative value of it's width
        constraintMenuLeft.constant = -constraintMenuWidth.constant
        
        // animate closing of the menu - including opacity value
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            self.viewShadow.alpha = 0
        }, completion: { (complete) in
            
            // reenable the screen edge pan gesture so we can detect it next time
            self.gestureScreenEdgePan.isEnabled = true
            
            // hide the view for dimming effect so it wont interrupt touches for views underneath it
            self.viewShadow.isHidden = true
        })
    }
    
    
    
}

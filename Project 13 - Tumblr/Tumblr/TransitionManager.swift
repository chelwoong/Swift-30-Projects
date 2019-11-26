//
//  TransitionManager.swift
//  Tumblr
//
//  Created by TTgo on 26/11/2019.
//  Copyright © 2019 TTgo. All rights reserved.
//

import UIKit

class TransitionManager: NSObject {
    fileprivate var isPresent = false
}

extension TransitionManager: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func offStage(_ amount: CGFloat) -> CGAffineTransform {
       return CGAffineTransform(translationX: amount, y: 0)
     }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        
        let screens: (from: UIViewController, to: UIViewController) = (
            transitionContext.viewController(forKey: .from)!,
            transitionContext.viewController(forKey: .to)!
        )
        
        let menuViewController = isPresent
            ? screens.from as! MenuViewController
            : screens.to as! MenuViewController
        let mainViewController = isPresent
        ? screens.to as! MenuViewController
        : screens.from as! MenuViewController
        
        let menuView = menuViewController.view
        let mainView = mainViewController.view
        
        if isPresent {
            offStageMenuController(menuViewController)
        }
        
        container.addSubview(mainView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            if isPresent {
                // onstageMenu
            }
        }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
    }
    
    func offStageMenuController(_ menuViewController: MenuViewController) {
        
        menuViewController.view.alpha = 0
        
        let topRowOffset: CGFloat = 300
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset: CGFloat = 50
        
        menuViewController.textPostIcon.transform = self.offStage(-topRowOffset)
        menuViewController.textPostLabel.transform = self.offStage(-topRowOffset)
        
        menuViewController.quotePostIcon.transform = self.offStage(-middleRowOffset)
        menuViewController.quotePostLabel.transform = self.offStage(-middleRowOffset)
        
        menuViewController.chatPostIcon.transform = self.offStage(-bottomRowOffset)
        menuViewController.chatPostLabel.transform = self.offStage(-bottomRowOffset)
        
        menuViewController.photoPostIcon.transform = self.offStage(topRowOffset)
        menuViewController.photoPostLabel.transform = self.offStage(topRowOffset)
        
        menuViewController.linkPostIcon.transform = self.offStage(middleRowOffset)
        menuViewController.linkPostLabel.transform = self.offStage(middleRowOffset)
        
        menuViewController.audioPostIcon.transform = self.offStage(bottomRowOffset)
        menuViewController.audioPostLabel.transform = self.offStage(bottomRowOffset)
    }
}

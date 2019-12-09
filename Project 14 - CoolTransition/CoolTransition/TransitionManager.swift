//
//  TransitionManager.swift
//  CoolTransition
//
//  Created by TTgo on 26/11/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class TransitionManager: NSObject {
    private var isPresenting = true
    
}

// MARK: UIViewControllerAnimatedTransitioning protocol methods

extension TransitionManager: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
}

extension TransitionManager: UIViewControllerAnimatedTransitioning {
    // return how many seconds the transiton animation will take
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        
        guard
            let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view
        else {
            print("view nill")
            return
        }
        
        // set up from 2D transforms that we'll use in the animation
        
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        toView.transform = isPresenting ? offScreenRotateIn : offScreenRotateOut
//        toView.transform = offScreenRotateIn
        
        print(toView.layer.frame, fromView.layer.frame)
        toView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        fromView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        print(fromView.layer.position, toView.layer.position)


        toView.layer.position = CGPoint(x: 0, y: 0)
        fromView.layer.position = CGPoint(x: 0, y: 0)
        print(toView.layer.frame, fromView.layer.frame)
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(
            withDuration: duration,
            delay: 1,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.8,
            options: [],
            animations: {
                print(self.isPresenting)
                fromView.transform = self.isPresenting ? offScreenRotateIn :offScreenRotateOut
                toView.transform = CGAffineTransform.identity
                
            }, completion: { finished in

                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
            }
        )
        
    }
}

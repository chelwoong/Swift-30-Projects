//
//  DetailViewController.swift
//  Animations
//
//  Created by TTgo on 26/09/2019.
//  Copyright © 2019 TTgo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var barTitle = ""
    var animation: Animation = .changeColor
    var animateView: UIView!
    fileprivate let duration = 2.0
    fileprivate let delay = 0.2
    fileprivate let scale = 1.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupRect()
        setupNavigationBar()
    }
    
    fileprivate func setupNavigationBar() {
        let barTitle = animation.rawValue
        navigationItem.title = barTitle
    }
    
    fileprivate func setupRect() {
        
        if animation == .curvePath {
            animateView = drawCircleView()
        } else if animation == .viewFadeIn {
            animateView = UIImageView(image: UIImage(named: "whatsapp"))
            animateView.frame = generalFrame
            animateView.center = generalCenter
        } else {
            animateView = drawRectView(.red, frame: generalFrame, center: generalCenter)
        }
        
        view.addSubview(animateView)
        view.addSubview(animateButton)
        
        animateButton.topAnchor.constraint(equalTo: animateView.bottomAnchor, constant: 100).isActive = true
        animateButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        animateButton.addTarget(self, action: #selector(animateButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func animateButtonTapped(_ sender: UIButton) {
        switch animation {
        case .changeColor:
            changeColor(colorSet.randomElement()!)
        case .roation2D:
            rotateView(Double.pi)
        case .autoChangeColor:
            autoChangeColor()
        case .colorFrameChange:
            let currentFrame = self.animateView.frame
            let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
            let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
            let thirdFrame = secondFrame.insetBy(dx: -15, dy: -20)
            colorFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
            
        case .curvePath:
            var controlPoint1 = self.animateView.center
            controlPoint1.y -= 125.0
            var controlPoint2 = controlPoint1
            controlPoint2.x += 40.0
            controlPoint2.y -= 125.0;
            var endPoint = self.animateView.center;
            endPoint.x += 75.0
            curvePath(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        case .viewFadeIn:
            viewFadeIn()
        }
    }
    
    // MARK: Methods for Animations
    fileprivate func changeColor(_ color: UIColor) {
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.backgroundColor = color
        }, completion: nil)
    }
    
    fileprivate func autoChangeColor() {
        UIView.animate(withDuration: self.duration, delay: self.delay, animations: {
//            print("auto changing")
            let color = colorSet.randomElement()!
            
            self.animateView.backgroundColor = color
        }) { _ in
            self.autoChangeColor()
        }
    }
    
    fileprivate func colorFrameChange(_ firstFrame: CGRect, _ secondFrame: CGRect, _ thirdFrame: CGRect,
                                      _ firstColor: UIColor, _ secondColor: UIColor, _ thirdColor: UIColor) {
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.backgroundColor = firstColor
            self.animateView.frame = firstFrame
        }, completion: { finished in
            UIView.animate(withDuration: self.duration, animations: {
                self.animateView.backgroundColor = secondColor
                self.animateView.frame = secondFrame
            }, completion: { finished in
                UIView.animate(withDuration: self.duration, animations: {
                    self.animateView.backgroundColor = thirdColor
                    self.animateView.frame = thirdFrame
                }, completion: nil)
            })
        })
    }
    
    fileprivate func rotateView(_ angel: Double) {
        UIView.animate(withDuration: self.duration, delay: self.delay, options: [.repeat], animations: {
            self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
        }, completion: nil)
    }
    
    fileprivate func multiPosition(_ firstPos: CGPoint, _ secondPos: CGPoint) {
        func simplePosition(_ pos: CGPoint) {
            UIView.animate(withDuration: self.duration, animations: {
                self.animateView.frame.origin = pos
            }, completion: nil)
        }
        
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.frame.origin = firstPos
        }, completion: { finished in
            simplePosition(secondPos)
        })
    }
    
    fileprivate func curvePath(_ endPoint: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) {
        let path = UIBezierPath()
        path.move(to: self.animateView.center)
        
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.cgPath
        
        // set some more parameters for the animation
        anim.duration = self.duration
        
        // add the animation to the squares 'layer' property
        self.animateView.layer.add(anim, forKey: "animate position along path")
        self.animateView.center = endPoint
    }
    
    fileprivate func viewFadeIn() {
        let secondView = UIImageView(image: UIImage(named: "facebook"))
        secondView.frame = self.animateView.frame
        secondView.alpha = 0.0
        
        view.insertSubview(secondView, aboveSubview: self.animateView)
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            secondView.alpha = 1.0
            self.animateView.alpha = 0.0
        }, completion: nil)
    }
    
    // MARK: - Views
    let animateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
}

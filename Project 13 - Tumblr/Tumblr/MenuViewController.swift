//
//  MenuViewController.swift
//  Tumblr
//
//  Created by woong on 22/10/2019.
//  Copyright © 2019 TTgo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let transitionManager = TransitionManager()
    
    let cellId = "cellIdentify"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        self.transitioningDelegate = self.transitionManager
        setupViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        
    }
    
    func setupViews() {
        view.addSubview(textPostIcon)
        view.addSubview(textPostLabel)
        
        view.addSubview(photoPostIcon)
        view.addSubview(photoPostLabel)
        
        view.addSubview(quotePostIcon)
        view.addSubview(quotePostLabel)
        
        view.addSubview(linkPostIcon)
        view.addSubview(linkPostLabel)
        
        view.addSubview(chatPostIcon)
        view.addSubview(chatPostLabel)
        
        view.addSubview(audioPostIcon)
        view.addSubview(audioPostLabel)
        
        view.addSubview(cancelButton)
        
        quotePostIcon.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -80).isActive = true
        quotePostIcon.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        
        quotePostLabel.anchor(
            top: quotePostIcon.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )
        
        // set center x align to quotePostIcon
        quotePostLabel.centerXAnchor.constraint(equalTo: quotePostIcon.centerXAnchor, constant: 0).isActive = true
        textPostIcon.centerXAnchor.constraint(equalTo: quotePostIcon.centerXAnchor, constant: 0).isActive = true
        textPostLabel.centerXAnchor.constraint(equalTo: quotePostIcon.centerXAnchor, constant: 0).isActive = true
        chatPostIcon.centerXAnchor.constraint(equalTo: quotePostIcon.centerXAnchor, constant: 0).isActive = true
        chatPostLabel.centerXAnchor.constraint(equalTo: quotePostIcon.centerXAnchor, constant: 0).isActive = true
        
        linkPostIcon.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 80).isActive = true
        linkPostIcon.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        
        linkPostLabel.anchor(
            top: linkPostIcon.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )
        
        // set center x align to linkPostIcon
        linkPostLabel.centerXAnchor.constraint(equalTo: linkPostIcon.centerXAnchor, constant: 0).isActive = true
        photoPostIcon.centerXAnchor.constraint(equalTo: linkPostIcon.centerXAnchor, constant: 0).isActive = true
        photoPostLabel.centerXAnchor.constraint(equalTo: linkPostIcon.centerXAnchor, constant: 0).isActive = true
        audioPostIcon.centerXAnchor.constraint(equalTo: linkPostIcon.centerXAnchor, constant: 0).isActive = true
        audioPostLabel.centerXAnchor.constraint(equalTo: linkPostIcon.centerXAnchor, constant: 0).isActive = true
        
        
        textPostLabel.bottomAnchor.constraint(equalTo: quotePostIcon.topAnchor, constant: -60).isActive = true
        textPostIcon.bottomAnchor.constraint(equalTo: textPostLabel.topAnchor, constant: -5).isActive = true
        
        photoPostLabel.bottomAnchor.constraint(equalTo: linkPostIcon.topAnchor, constant: -60).isActive = true
        photoPostIcon.bottomAnchor.constraint(equalTo: photoPostLabel.topAnchor, constant: -5).isActive = true
        
        chatPostIcon.topAnchor.constraint(equalTo: quotePostLabel.bottomAnchor, constant: 60).isActive = true
        chatPostLabel.topAnchor.constraint(equalTo: chatPostIcon.bottomAnchor, constant: 5).isActive = true
        
        audioPostIcon.topAnchor.constraint(equalTo: linkPostLabel.bottomAnchor, constant: 60).isActive = true
        audioPostLabel.topAnchor.constraint(equalTo: audioPostIcon.bottomAnchor, constant: 5).isActive = true
        
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    }
    
    @objc func didTapCancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Views
    let textPostIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Text")
        
        return imageView
    }()
    
    let textPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return label
    }()
    
    let photoPostIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Photo")
        
        return imageView
    }()
    
    let photoPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photo"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        
        return label
    }()
    
    let quotePostIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Quote")
        
        return imageView
    }()
    
    let quotePostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quote"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return label
    }()
    
    let linkPostIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Link")
        
        return imageView
    }()
    
    let linkPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Link"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return label
    }()
    
    let chatPostIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Chat")
        
        return imageView
    }()
    
    let chatPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chat"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return label
    }()
    
    let audioPostIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Audio")
        
        return imageView
    }()
    
    let audioPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Audio"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = .init(x: 0, y: 0, width: 100, height: 100)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return button
    }()
}

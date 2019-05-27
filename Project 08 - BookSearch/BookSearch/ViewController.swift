//
//  ViewController.swift
//  BookSearch
//
//  Created by woong on 24/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bookCellId = "bookCellId"
    var books: [Book] = [
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕"),
    ]
    
    let bookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.yellow
        
        return collectionView
    }()
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Book Search"
        
        view.addSubview(bookCollectionView)
        setlayout()
        
        bookCollectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: bookCellId)
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Books"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func setlayout() {
        NSLayoutConstraint.activate([
            bookCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            bookCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            bookCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bookCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            
            ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellId, for: indexPath)
        
        guard let bookCell: BookCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellId, for: indexPath) as? BookCollectionViewCell else {
            return defaultCell
        }
        
        bookCell.bookImageView.image = books[indexPath.item].bookImage
//        bookCell.backgroundColor = UIColor.blue
        bookCell.bookNameLabel.text = books[indexPath.item].bookTitle
        bookCell.bookAuthorLabel.text = books[indexPath.item].author
        bookCell.bookDateLabel.text = books[indexPath.item].date
        
        return bookCell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 15, height: view.frame.height / 3)
    }
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}


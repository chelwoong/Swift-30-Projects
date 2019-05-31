//
//  ViewController.swift
//  BookSearch
//
//  Created by woong on 24/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables and Properties
    
    let bookCellId = "bookCellId"
    var books: [Book] = [
        Book(bookTitle: "지대넓얕", author: "채사장", date: "2017.01.17", bookImageName: "지대넓얕", category: "Best"),
        Book(bookTitle: "함께자라기", author: "김창준", date: "2018.11.30", bookImageName: "함께자라기", category: "New"),
        Book(bookTitle: "부의 추월차선", author: "엠제이 드마코", date: "2013.08.26", bookImageName: "부의 추월차선", category: "Best"),
        Book(bookTitle: "개인주의자선언", author: "문유석", date: "2015.11.03", bookImageName: "개인주의자선언", category: "Best"),
        Book(bookTitle: "오늘부터 말공부를 시작합시다", author: "김선에스더", date: "2019.05.21", bookImageName: "오늘부터 말공부를 시작합시다", category: "New"),
        Book(bookTitle: "빨강 머리 앤", author: "루시 모드 몽고메리", date: "2019.05.10", bookImageName: "빨강 머리 앤", category: "New"),
        
    ]
    
    var filteredBooks: [Book] = []
    
    let bookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = UIColor.green
        
        return collectionView
    }()
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Book Search"
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search Books"
        searchController.searchBar.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.scopeButtonTitles = ["All", "Best", "New"]
        searchController.searchBar.delegate = self
        
        
        view.addSubview(bookCollectionView)
        bookCollectionView.backgroundColor = UIColor.white
        setlayout()
        
        bookCollectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: bookCellId)
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
    }
    
    // MARK: - Helper funcs
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? false
    }
    
    func filterContentForSearch(_ searchText: String, scope: String = "All" ) {
        filteredBooks = books.filter({ (book: Book) -> Bool in
            let doesCategoryMatch = (scope == "All") || (book.category == scope)
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && book.title.lowercased().contains(searchText.lowercased())
            }
            
        })
        
        bookCollectionView.reloadData()
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        
        return searchController.isActive && (searchBarScopeIsFiltering || searchController.isActive && !searchBarIsEmpty())
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
        
        if isFiltering() {
            return filteredBooks.count
        }
        
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellId, for: indexPath)
        
        guard let bookCell: BookCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellId, for: indexPath) as? BookCollectionViewCell else {
            return defaultCell
        }
        
        let book: Book
        if isFiltering() {
            book = filteredBooks[indexPath.item]
        } else {
            book = books[indexPath.item]
        }
        
        bookCell.bookImageView.image = book.bookImage
        bookCell.bookTitleLabel.text = book.title
        bookCell.bookAuthorLabel.text = book.author
        bookCell.bookDateLabel.text = book.date
        bookCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        bookCell.layer.cornerRadius = 5
        bookCell.layer.borderWidth = 1
        return bookCell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 15, height: view.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 30
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
}

extension ViewController: UISearchResultsUpdating {
    
    // MARK: - UISearchResultsUpdating Delegate

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope: String
        if let scopeTitle = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] {
            scope = scopeTitle
            
            filterContentForSearch(searchController.searchBar.text ?? "", scope: scope)
        }
        
        
    }
}

extension ViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearch(searchBar.text ?? "", scope: searchBar.scopeButtonTitles?[selectedScope] ?? "All")
    }
}


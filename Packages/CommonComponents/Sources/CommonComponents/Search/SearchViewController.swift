//
//  SearchViewController.swift
//  CommonComponents
//
//  Created by Talip on 23.03.2022.
//

import UIKit

final public class SearchViewController: UISearchController {

    /// This property will decide whether search is active or inactive.
    private let minCountToSearch: Int
    private var throttler: Throttable
    /// Notifies with searchBarText when updates search results
    public var didUpdateText: ((String?) -> Void)?
    /// Notifies when user clicks cancel, delete or when searchBarText less than the minCountToSearch
    public var didClear: (() -> Void)?

    /// This property prevents to duplicate work item after throttler.Will be cleared when the searchBar text count less than the minCountToSearch.
    private var lastSearchedText: String? = ""


    private var textField: UITextField? {
        if #available(iOS 13, *) {
            return searchBar.searchTextField
        }

        let subViews = searchBar.subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter {$0 is UITextField}).first as? UITextField else { return nil}
        return textField
    }

    private var activityIndicator: UIActivityIndicatorView? {
        return textField?.leftView?.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }

    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                makeActivityIndicator()
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }

    public init(minCountToSearch: Int = 1,
                throttler: Throttable = Throttler(),
                placeHolderText: String) {
        self.minCountToSearch = minCountToSearch
        self.throttler = throttler
        super.init(searchResultsController: nil)
        searchResultsUpdater = self
        searchBar.placeholder = placeHolderText
        observeThrottleForTaskTermination()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > minCountToSearch {
            isLoading = true
            throttler.throttle { [weak self] in
                let searchText = searchController.searchBar.text
                if searchText != self?.lastSearchedText {
                    self?.lastSearchedText = searchText
                    self?.didUpdateText?(searchController.searchBar.text)
                }
            }
        } else {
            lastSearchedText = ""
            throttler.cancel()
            isLoading = false
            didClear?()
        }
    }
}

// MARK: Private Methods
private extension SearchViewController {
    func makeActivityIndicator() {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.color = .gray
        indicator.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 240/255, alpha: 1.0)
        indicator.startAnimating()
        textField?.leftView?.addSubview(indicator)
        let leftViewSize: CGSize = textField?.leftView?.frame.size ?? .zero
        indicator.center = CGPoint(x: leftViewSize.width / 2, y: leftViewSize.height / 2)
    }

    func observeThrottleForTaskTermination() {
        throttler.didTaskFinished = { [weak self] in
            self?.isLoading = false
        }
    }
}

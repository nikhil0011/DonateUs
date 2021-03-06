//
//  ViewController.swift
//  DonateUs
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//
private let reuseIdentifier = "Cell"
import UIKit
class HomeViewController: UICollectionViewController {
    let viewModel = CharityListViewModel()
    var response: ChairtyListResponse?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Organisations"
        collectionView.backgroundColor = ColorPalette.whiteColor
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        viewModel.returnPickupList()
        observerCharityViewModel()
    }
    func observerCharityViewModel() {
        ActivityIndicator.shared.showProgressView(self.view)
        viewModel.bindableCharityList.bind { [weak self] (response, error) in
            guard let reference = self else { return }
            DispatchQueue.main.async {
                ActivityIndicator.shared.hideProgressView()
            }
            if let err = error {
                AlertController.showAlert(message: err, title: Constants.reqFailed) { _ in }
                debugPrint("Error in Fetching Data From Chairty API \(err)")
                return
            }
            guard let data = response, !data.data.isEmpty else {
                let alert = AlertController.showAlert(message: Constants.noDataInList, title: Constants.reqFailed) { _ in }
                reference.present(alert: alert)
                return
            }
            reference.response = data
            DispatchQueue.main.async {
                reference.collectionView.reloadData()
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return response?.data.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        let row = indexPath.row
        guard let list = response?.data else { return cell }
        cell.setUp(model: CharityCellViewModel(data: list[row]))
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let donationView = DonationViewController()
        self.navigationController?.pushViewController(donationView, animated: true)
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let list = response?.data, !list.isEmpty else { return .zero }
        return CGSize(width: self.view.frame.width - 10, height: 80)
    }
}

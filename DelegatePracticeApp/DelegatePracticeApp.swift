//
//  ViewController.swift
//  DelegatePracticeApp
//
//  Created by beck on 2023/08/16.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let identifer = "cell"
    var selectedCellIndex: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.delagate = self
        cell.cellDone = { [weak self] in
            self?.selectedCellIndex = indexPath
        }
        cell.titleLabel.text = "やること:\(indexPath.row)"
        return cell
    }
}

extension ViewController: TableViewDelegate {
    func buttonTapAction() {
        if let selectedCell = selectedCellIndex {
            print("\(selectedCell.row)番目のボタンがタップされた")
        }
    }
    
    
}

//
//  ListViewController.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func onSelect(item: ListItem)
}

class ListViewController: UIViewController {

    let reuseId = "reuseId"
    
    weak var delegate: ListViewControllerDelegate?
    
    var viewModel: ListViewModel!

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.register(ListCell.self, forCellReuseIdentifier: self.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = true
        return tableView
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellModels.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? ListCell else { fatalError() }
        cell.selectionStyle = .blue
        cell.cellModel = self.viewModel.cellModels[indexPath.row]
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.viewModel.items[indexPath.row]
        delegate?.onSelect(item: item)
    }
}

class ListCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    var cellModel: ListCellModel? {
        didSet {
            textLabel?.attributedText = self.cellModel?.title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListCoordinator: ListViewControllerDelegate{
    public func onSelect(item: ListItem) {
        let detail = DetailViewController(item: item)
        detail.delegate = self
        self.rootVC?.pushViewController(detail, animated: true)
    }
    
}

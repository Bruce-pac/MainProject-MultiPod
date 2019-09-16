//
//  ListViewController.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import UIKit

public class ListViewController: UIViewController {

    let reuseId = "reuseId"

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseId)
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
        return 10
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.textLabel?.text = "I'm the number\(indexPath.row)"
        cell.selectionStyle = .blue
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(id: indexPath.row)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

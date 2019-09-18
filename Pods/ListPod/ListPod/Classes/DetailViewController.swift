//
//  DetailViewController.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var textView: UITextView = {
        let textView = UITextView(frame: self.view.bounds)
        textView.textAlignment = NSTextAlignment.center
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()

    let id: Int

    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        textView.text = "I'm the detail of \(id) row item"

        let payItem = UIBarButtonItem(title: "pay", style: .plain, target: self, action: #selector(pay))

        navigationItem.rightBarButtonItem = payItem
    }

    @objc func pay() {
        ModuleManager.shared.dependency?.coordinator.jumpPayPage(based: self, with: id)
    }
}

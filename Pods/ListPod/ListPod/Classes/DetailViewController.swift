//
//  DetailViewController.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func onTapPay(_ vc: DetailViewController)
}

class DetailViewController: UIViewController {

    lazy var textView: UITextView = {
        let textView = UITextView(frame: self.view.bounds)
        textView.textAlignment = NSTextAlignment.center
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()

    let item: ListItem
    
    weak var delegate: DetailViewControllerDelegate?

    init(item: ListItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        textView.text = """
        I'm the detail of \(item.id) row item.
        \(item.title)
        """

        let payItem = UIBarButtonItem(title: "pay", style: .plain, target: self, action: #selector(pay))

        navigationItem.rightBarButtonItem = payItem
    }

    @objc func pay() {
        delegate?.onTapPay(self)
    }
}

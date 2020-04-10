//
//  DetailViewController.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import UIKit
import LBCoordinator

protocol DetailTestAViewControllerDelegate: AnyObject {
    func onTapPay(_ vc: DetailTestAViewController)
}

class DetailTestAViewController: UIViewController {

    lazy var textView: UITextView = {
        let textView = UITextView(frame: self.view.bounds)
        textView.textAlignment = NSTextAlignment.center
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()

    let item: ListItem
    
    weak var delegate: DetailTestAViewControllerDelegate?

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
        A Test
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

class DetailTestBViewController: UIViewController {

    lazy var imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage.imageWith(UIColor.red))
        return imgView
    }()
    lazy var textView: UITextView = {
        let textView = UITextView(frame: self.view.bounds)
        textView.textAlignment = NSTextAlignment.center
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()

    lazy var accountBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("去Account个人中心", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(onTapAccountBtn(_:)), for: .touchUpInside)
        return btn
    }()

    let item: ListItem

    init(item: ListItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(accountBtn)
        textView.text = """
        B Test
        I'm the detail of \(item.id) row item.
        \(item.title)
        """
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        textView.frame = CGRect(x: 0, y: imageView.frame.maxY + 50, width: view.frame.width, height: 300)
        accountBtn.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
    }

    @objc func onTapAccountBtn(_ sender: UIButton) {
        lb_coordinatingMessage(LBCoordinatorEventName.detailBToAccount, object: nil, userInfo: nil)
    }
}

extension UIImage {
    static func imageWith(_ color: UIColor) -> UIImage? {
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: CGPoint.zero, size: size))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}

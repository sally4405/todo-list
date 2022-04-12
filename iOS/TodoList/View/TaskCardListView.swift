import UIKit

class TaskCardListView: UIView {
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var taskCountBadge: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setTableView(with viewController: UIViewController & UITableViewDelegate & UITableViewDataSource) {
        self.table.delegate = viewController
        self.table.dataSource = viewController
        let nibName = UINib(nibName: NameSpace.nib.taskCardViewCell, bundle: nil)
        self.table.register(nibName, forCellReuseIdentifier: NameSpace.identifier.taskCardViewCell)

    }

    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: .addTaskButtonTapped, object: nil)
    }
    
    func setTitle(to text: String) {
        self.title.text = text
    }
    
    func setCountBadge(with count: Int) {
        self.taskCountBadge.text = String(count)
    }
}


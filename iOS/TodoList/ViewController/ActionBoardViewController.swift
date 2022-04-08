import UIKit

class ActionBoardViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
    }
    
    private func setupCell() {
        let nibName = UINib(nibName: NameSpace.nib.actionCardViewCell, bundle: nil)
        table.delegate = self
        table.dataSource = self
        table.register(nibName, forCellReuseIdentifier: NameSpace.identifier.actionCardViewCell)
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.view.isHidden = true
        self.view.superview?.isHidden = true
    }
}

extension ActionBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NameSpace.identifier.actionCardViewCell, for: indexPath) as? ActionCardViewCell else { return UITableViewCell() }
        return cell
    }

}
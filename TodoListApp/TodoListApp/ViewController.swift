import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var gorevTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var gorevler: [String] = [] // Tüm görevler burada tutulacak

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func ekleButonaTiklandi(_ sender: UIButton) {
        if let yeniGorev = gorevTextField.text, !yeniGorev.isEmpty {
            gorevler.append(yeniGorev)
            tableView.reloadData()
            gorevTextField.text = "" // boşalt
        }
    }

    // TableView veri kaynak fonksiyonları
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gorevler.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let hucre = UITableViewCell()
        hucre.textLabel?.text = gorevler[indexPath.row]
        return hucre
    }
}

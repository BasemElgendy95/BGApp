//
//  EmptyViewController.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import UIKit

class EmptyViewController: UIViewController {

    @IBOutlet weak var emptyTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        emptyTableView.setupEmpty(controller: self)
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EmptyViewController : UITableViewDelegate , UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "data"
        return cell
    }
}

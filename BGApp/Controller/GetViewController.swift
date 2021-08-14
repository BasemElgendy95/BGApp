//
//  GetViewController.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import UIKit
import PromiseKit
import Moya

class GetViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    private let geoServices = MoyaProvider<GEOServices>()
    private var tableData : [CountryModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.setupEmpty(controller: self)
        getCont()
    }
    
    private func getCont(){
        firstly { () -> Promise<Any> in
            BGLoading.showLoading(view)
            return BGServicesManager.CallApi(self.geoServices,GEOServices.countries)
        }.done({ [self] response in
            let result = response as! Response
            guard BGNetworkHelper.validateResponse(response: result) else{return}
            let c : CountryDataModel = try BGDecoder.decode(data: result.data)
            tableData = c.data
        }).ensure { [self] in
            BGLoading.dismissLoading()
            myTableView.reloadData()
        }.catch { (error) in
            print(error)
        }
    }
    
}

extension GetViewController : UITableViewDelegate , UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "baseTableViewCell", for: indexPath) as! BaseTableViewCell
        cell.setupCell(cellData : (tableData?[indexPath.row])!)
        return cell
    }
}

//
//  TeamDetailsViewController.swift
//  SportingApp
//
//  Created by Eman on 09/02/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController ,TeamURLProtocol {
    var teamUrl : TeamDetailsUrl!
    
    
    var team : TeamDetails!
    var viewModel : TeamDetailsViewModel!
    
    static var teamId : Int?
    @IBOutlet weak var teamlogoimg: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamUrl = TeamDetailsUrl()
        teamsTable.delegate = self
        teamsTable.dataSource = self
        nipFileConfig()
        viewModel = TeamDetailsViewModel()
        viewModel.getItems(url:getTeamURL())
        team = TeamDetails()
        viewModel.bindResultToTableViewController = { () in self.renderView(team: self.viewModel.vmResult )}
      
        
    }
}

extension TeamDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func nipFileConfig(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        teamsTable.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func renderView(team: TeamDetails?){
        guard let newItems = team?.players
        else{return}
        self.team.players = newItems
        DispatchQueue.main.async {
            self.teamsTable.reloadData()
        }
        
    }
    
    
//    func getURL()-> URL{
//        let url = URL(string: URLServiceForTeams(endPoint: "football" , teamId: TeamDetailsViewController.teamId! ).url)!
//        return url
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        cell.favoriteLeagueName.text = team.players?[indexPath.row].player_name
            let url = URL(string: team.players?[indexPath.row].player_image ?? " ")
            cell.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: "player"))
       // teamNameLabel.text = team.team_name ?? "lklk"
//        let url2 = URL(string: team.team_logo ?? " ")
//        teamlogoimg?.kf.setImage(with: url2,placeholder: UIImage(named: "teams"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.players?.count ?? 0
    }
    func getTeamURL() -> URL {
        teamUrl.getTeamURL()
    }
}

//
//  PatternListController.swift
//  PointClouds
//
//  Created by David Lee on 2016. 2. 10..
//  Copyright © 2016년 dhlee. All rights reserved.
//

import UIKit

class PatternListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var _library = PointCloudLibrary.getDemoLibrary()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = _library.pointClouds[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _library.pointClouds.count
    }
}

import UIKit
import RealmSwift

extension UITableView {
	
	func applyChanges<T>(changes: RealmCollectionChange<T>) {
		switch changes {
			case .initial: reloadData()
			case .update(let results, let deletions, let insertions, let updates):
				let fromRow = { (row: Int) in return IndexPath(row: row, section: 0) }
				beginUpdates()
				insertRows(at: insertions.map(fromRow), with: .automatic)
				reloadRows(at: updates.map(fromRow), with: .automatic)
				deleteRows(at: deletions.map(fromRow), with: .automatic)
				endUpdates()
			case .error(let error): fatalError("\(error)")
		}
	}
}

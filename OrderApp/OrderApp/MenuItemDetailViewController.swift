import UIKit

@MainActor
class MenuItemDetailViewController: UIViewController {
    
    //MARK: - Properties
    let menuItem: MenuItem
    
    //MARK: - Outlet
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    @IBOutlet var detailTextLabel: UILabel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom methods
    func updateUI() {
        nameLabel.text = menuItem.name
        detailTextLabel.text = menuItem.detailText
        priceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
        
        Task.init {
            let image = try? await MenuController.shared.fetchImage(from: menuItem.imageURL)
            imageView.image = image
        }
    }
    
    //MARK: - Action
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.1,
                       options: [], animations: {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        MenuController.shared.order.menuItems.append(menuItem)
    }
}

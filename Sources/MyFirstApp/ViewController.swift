import UIKit

class ViewController: UIViewController {
    
    var nameLabel = UILabel()
    var profileImageView = UIImageView()
    var followButton = UIButton()
    var bioTextView = UITextView()
    var commentTextField = UITextField()

    var isFollowed = false

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additonial setup after loading the view.
        view.backgroundColor = UIColor.red
        view.backgroundColor = UIColor.white
        view.backgroundColor = .blue
        view.backgroundColor = .orange

        nameLabel.text = "Jeff Bezos"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        profileImageView = UIImageView()
        //profileImageView.image = UIImage(named: "Jeff-Bezos")
        profileImageView.image = UIImage(systemName: "person.crop.circle.fill")
        profileImageView.clipsToBounds = false
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)

        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.systemBlue, for: .normal)
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        followButton.layer.cornerRadius = 10
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.addTarget(self, action: #selector(followButtonPressed), for: .touchUpInside)
        view.addSubview(followButton)

        bioTextView.text = """
            Jeff Bezos is a businessman that offers free Banana
            in Seatle. His main Corporation, Amazon, was taxed
            about .9% only between 2014  and 2019, while the American
            citizen is taxed up to 40%. The saying goes as he said:
            'tax me of you can'. Only his ex-wife managed to taxe
            him 11 Billion dollars after she divorced him.
            Bezos made a space craft shaped like his head lol
            """
        
        bioTextView.allowsEditingTextAttributes = false
        bioTextView.font = .systemFont(ofSize: 14)
        bioTextView.backgroundColor = .orange
        bioTextView.textAlignment = .left
        //bioTextView.attributedText = " bla bla"
        bioTextView.textColor = .white
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextView)

        // commentTextField.attributedText = NSAttributedString(string: "put your comment here!")
        commentTextField.placeholder = " comment here! ..."
        commentTextField.font = UIFont.preferredFont(forTextStyle: .body)
        commentTextField.textColor = .black
        commentTextField.backgroundColor = .white
        //commentTextField.becomeFirstResponder()    //
        // commentTextField.background = UIImage(named: "Jeff-Bezos")
        //commentTextField.resignFirstResponder()
        commentTextField.autocorrectionType = UITextAutocorrectionType.no       // autocorrection on 
        commentTextField.layer.shadowColor = UIColor.gray.cgColor
        commentTextField.layer.shadowOpacity = 0.4
        commentTextField.layer.shadowRadius = 20
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentTextField)

        setupConstraints() 
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo:
                    view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo:
                    nameLabel.bottomAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo:
                    profileImageView.bottomAnchor, constant: 20),
            followButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo:
                    followButton.bottomAnchor, constant: 20),
            bioTextView.leadingAnchor.constraint(equalTo:
                    view.leadingAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo:
                    view.trailingAnchor, constant: -20),
            bioTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            commentTextField.topAnchor.constraint(equalTo:
                    bioTextView.bottomAnchor, constant: 20),
            commentTextField.leadingAnchor.constraint(equalTo:
                    view.leadingAnchor, constant: 20),
            commentTextField.trailingAnchor.constraint(equalTo:
                    view.trailingAnchor, constant: -20),
            commentTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    /* Que fait-on lorsque le bouton "follow" est pressé?
        nous allons juste modifier le titre du bouton pour l'instant
     */
    @objc func followButtonPressed() {
        if(isFollowed) {
            isFollowed = false
            followButton.setTitle("Follow", for: .normal)
        }
        else {
            isFollowed = true
            followButton.setTitle("Unfollow", for: .normal)
        }
    }
}
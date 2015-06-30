class RegisterScreen < PM::FormScreen
  title "Login Screen"

  def form_data
    [{
      title: "Account Information",
      # footer: "Some help text",
      cells: [{
        name: "email",
        title: "Email",
        type: :email,
        value: "test"
        # image: UIImage.imageNamed('email_icon')
      }, {
        name: "password",
        title: "Password",
        type: :password,
        value: ""
        # image: UIImage.imageNamed('key_icon')
      }, {
        name: :submit,
        title: "Submit",
        type: :button,
        action: "submit_login:"
      }]
    }]
  end

  def submit_login(cell)
    puts "submitted"
  end

end

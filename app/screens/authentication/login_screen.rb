class LoginScreen < PM::FormScreen
  attr_accessor :original_owner
  title "Login Screen"

  def form_data
    [{
      title: "Account Information",
      # footer: "Some help text",
      cells: [{
        name: "email",
        title: "Email",
        type: :email,
        value: "test@test.com"
        # image: UIImage.imageNamed('email_icon')
      }, {
        name: "password",
        title: "Password",
        type: :password,
        value: "1234567890"
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
    send_request
  end

  def send_request
    @client = AFMotion::Client.build("https://ps4-lfg.herokuapp.com/") do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      request_serializer :json
      response_serializer :json
    end

    @client.post('api/v1/user_login', {
      user: {
        email: render_form[:email],
        password: render_form[:password]
      }
    }) do |result|
      puts result.inspect
      user = result.object["user"]
      puts user
      result.object["user"] ? authenticated_user(user["auth_token"], user["email"]) : unauthorized_user
    end
  end

  def authenticated_user(token, email)
    App::Persistence['authToken'] = token
    App::Persistence['userEmail'] = email
    self.dismissViewControllerAnimated(true, completion: nil)
    self.original_owner.public_send(:viewDidLoad)
    puts self.original_owner
  end

  def unauthorized_user
    App.alert("Unauthorized.", {cancel_button_title: "Ok", message: "Please register for an account if you haven't already."})
  end

end

class LoginController < UIViewController
  attr_accessor :original_owner

  def loadView
    # Do not call super
    # Set view to a scroll view to eliminate navigation positioning bugs
    self.view = UIScrollView.new
  end

  def viewDidLoad
    super
    init_nav
    init_screen
  end

  def init_nav
    self.title = 'Login'
  end

  def init_screen
    rmq.stylesheet = LoginControllerStylesheet
    rmq(self.view).apply_style :root_view

    init_email_field
    init_password_field

    rmq.append(UIButton, :submit_button).on(:touch) do
      send_request
    end
  end

  def init_email_field
    rmq.append(UILabel, :email_label)
    @email_field = rmq.append(UITextField, :email_field).get
    @email_field.setKeyboardType(UIKeyboardTypeEmailAddress)
    @email_field.becomeFirstResponder
    @email_field.setReturnKeyType UIReturnKeyDone
    @email_field.delegate = self
  end

  def init_password_field
    rmq.append(UILabel, :password_label)
    @password_field = rmq.append(UITextField, :password_field).get
    @password_field.setReturnKeyType UIReturnKeyDone
    @password_field.delegate = self
  end

  def textFieldShouldReturn(textField)
    @email_field.resignFirstResponder
    @password_field.resignFirstResponder

    if (@email_field.text != '') && (@password_field.text == '')
      @password_field.becomeFirstResponder
    end

    send_request if (@email_field.text != '') && (@password_field.text != '')
    true
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
        email: @email_field.text,
        password: @password_field.text
      }
    }) do |result|
      if user = result.object["user"]
        authenticated_user(
          result.object["user"]["auth_token"],
          result.object["user"]["email"]
        )
      else
        unauthorized_user
      end
    end
  end

  def authenticated_user(token, email)
    App::Persistence['authToken'] = token
    App::Persistence['userEmail'] = email
    self.dismissViewControllerAnimated(true, completion: nil)
    self.original_owner.public_send(:viewDidLoad)
  end

  def unauthorized_user
    App.alert("Unauthorized.", {
      cancel_button_title: "Ok",
      message: "Please register for an account if you haven't already."
    })
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end
end

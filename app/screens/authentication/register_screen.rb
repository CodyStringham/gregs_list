# class RegisterScreen < PM::FormScreen
#   attr_accessor :original_owner
#   title "Register with PS4 LFG"

#   def form_data
#     [{
#       title: "Account Information",
#       # footer: "Some help text",
#       cells: [{
#         name: "email",
#         title: "Email",
#         type: :email,
#         value: "billy@bob.com"
#         # image: UIImage.imageNamed('email_icon')
#       }, {
#         name: "password",
#         title: "Password",
#         type: :password,
#         value: "1234567890"
#         # image: UIImage.imageNamed('key_icon')
#       }, {
#         name: "gamertag",
#         title: "Gamertag",
#         type: :text,
#         value: "BillyKilly"
#         # image: UIImage.imageNamed('key_icon')
#       }, {
#         name: "mic",
#         title: "Mic",
#         type: :boolean,
#         value: "true"
#         # image: UIImage.imageNamed('key_icon')
#       }, {
#         name: "region",
#         title: "Region",
#         type: :text,
#         value: "US"
#         # image: UIImage.imageNamed('key_icon')
#       }, {
#         name: "language",
#         title: "Language",
#         type: :text,
#         value: "EN"
#         # image: UIImage.imageNamed('key_icon')
#       }, {
#         name: :submit,
#         title: "Submit",
#         type: :button,
#         action: "submit_login:"
#       }]
#     }]
#   end

#   def submit_login(cell)
#     send_request
#   end

#   def send_request
#     @client = AFMotion::Client.build("#{AppDelegate::WEB_APPLICATION_URL}/") do
#       header "Accept", "application/json"
#       header "Content-Type", "application/json"
#       request_serializer :json
#       response_serializer :json
#     end

#     @client.post('api/v1/user_register', {
#       user: {
#         email: render_form[:email],
#         password: render_form[:password],
#         gamertag: render_form[:gamertag],
#         mic: render_form[:mic],
#         region: render_form[:region],
#         language: render_form[:language],
#       }
#     }) do |result|
#       if user = result.object["user"]
#         authenticated_user(result.object["user"]["auth_token"], result.object["user"]["email"])
#       else
#         unauthorized_user(result.object["error"])
#       end
#     end
#   end

#   def authenticated_user(token, email)
#     App::Persistence['authToken'] = token
#     App::Persistence['userEmail'] = email
#     self.dismissViewControllerAnimated(true, completion: nil)
#     self.original_owner.public_send(:viewDidLoad)
#   end

#   def unauthorized_user(errors)
#     App.alert("Error:", {
#       cancel_button_title: "Ok",
#       message: "#{errors}"
#     })
#   end

# end

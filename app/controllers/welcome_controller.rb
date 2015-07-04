class WelcomeController < UIViewController
  attr_accessor :original_owner

  def loadView
    # Do not call super
    # Set to scroll view to eliminate navigation positioning bugs
    self.view = UIScrollView.new
  end

  def viewDidLoad
    super
    init_nav
    init_screen
  end

  def init_nav
    self.title = "Welcome"
  end

  def init_screen
    rmq.stylesheet = WelcomeControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UILabel, :welcome_title)
    rmq.append(UILabel, :welcome_text)
    rmq.append(UIView, :button_group)

    rmq(:button_group).append(UIButton, :register_button).on(:touch) do
      puts 'Register Touched'
    end

    rmq(:button_group).append(UIButton, :login_button).on(:touch) do
      controller = LoginController.new
      controller.original_owner = self.original_owner
      self.navigationController.pushViewController(controller, animated: true)
    end
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

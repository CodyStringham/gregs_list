class AddLoadLabel < UIViewController

  def initWithOwner(owner)
    self.init
    @owner = owner
    self
  end

  def generate_label
    load_label = UILabel.alloc.initWithFrame(CGRectZero)
    load_label.textAlignment = UITextAlignmentCenter
    load_label.text = "Loading..."
    load_label.textColor = "#848484".to_color
    load_label.setFont(UIFont.systemFontOfSize(24))
    load_label.sizeToFit
    load_label.center = CGPointMake((@owner.view.frame.size.width / 2), @owner.view.frame.size.height / 2)

    load_label
  end

end

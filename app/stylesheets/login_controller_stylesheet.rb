class LoginControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
    st.frame = {l: 0, t: 0, w: screen_width, h: screen_height}
    st.paging = false
    st.scroll_enabled = true
    st.direction_lock = false
    st.bounces = true
    st.content_size = CGSizeMake(screen_width, screen_height)
    st.shows_horizontal_scroll_indicator = false
    st.shows_vertical_scroll_indicator = true
    st.scroll_indicator_insets = UIEdgeInsetsMake (10, 0, 20, 0)
  end

  def email_label(st)
    st.frame = {t: 20, l: 20, w: screen_width - 40, h: 20}
    st.text = 'Email:'
  end

  def email_field(st)
    st.frame = {bp: 10, l: 20, w: (screen_width - 40), h: 40}
    st.border_color = rmq.color('#e2e2e2')
    st.border_width = 2
    st.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
  end

  def password_label(st)
    st.frame = {bp: 20, l: 20, w: (screen_width - 40), h: 20}
    st.text = 'Password:'
  end

  def password_field(st)
    st.frame = {bp: 10, l: 20, w: (screen_width - 40), h: 40}
    st.border_color = rmq.color('#e2e2e2')
    st.border_width = 2
    st.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
    st.secure_text_entry = 'yes'
  end

  def submit_button(st)
    st.frame = {bp: 20, l: 20, w: (screen_width / 2 - 40), h: 50}
    st.background_color = rmq.color('#0d47a1')
    st.color = rmq.color('#FFF')
    st.corner_radius = 3
    st.text = 'Submit'
  end
end

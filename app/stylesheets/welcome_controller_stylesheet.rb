class WelcomeControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def welcome_title(st)
    st.frame = {t: 20, l: 20, w: (screen_width - 20), h: 30}
    st.text = 'Welcome to PS4 LFG'
    st.color = rmq.color('#000')
    st.font = font.medium
  end

  def welcome_text(st)
    st.frame = {bp: 20, l: 20, w: (screen_width - 20), h: 20}
    st.text = 'Please register or login to continue'
    st.color = rmq.color('#000')
  end

  def button_group(st)
    st.frame = {bp: 40, l: 20, w: (screen_width - 40), h: 50}
  end

  def register_button(st)
    st.frame = {l: 0, w: (screen_width / 2 - 30), h: 50}
    st.background_color = rmq.color('#0d47a1')
    st.color = rmq.color('#FFF')
    st.corner_radius = 3
    st.text = "Register"
  end

  def login_button(st)
    st.frame = {fr: 0, w: (screen_width / 2 - 30), h: 50}
    st.background_color = rmq.color('#0d47a1')
    st.color = rmq.color('#FFF')
    st.corner_radius = 3
    st.text = "Login"
  end

end

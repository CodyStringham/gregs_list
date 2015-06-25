# Main Controller
class DestinyJsonController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "DestinyJSON"

    selected = UIImage.imageNamed("destiny-on.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    unselected = UIImage.imageNamed("destiny.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    self.tabBarItem.setFinishedSelectedImage(selected, withFinishedUnselectedImage: unselected)

    self
  end

  def viewDidLoad
    self.title = "DestinyJSON"
    self.view.backgroundColor = UIColor.whiteColor
    @data = get_info
    table_setup
  end

  def get_info
    # Our request url, you are going to need a forcase IO api key,
    url_string = "https://ps4-lfg.herokuapp.com/destiny.json"

    # Send the request and encode it for us `app/lib/url_request.rb`
    url_response = UrlRequest.send_request(url_string)

    # Decode the request and parse it as JSON `app/lib/json_parser.rb`
    JsonParser.decode(url_response)
  end

  def table_setup
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
    self.view.addSubview(@table)

    @table.dataSource = self
    @table.delegate = self
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
     @reuseIdentifier ||= "CELL_IDENTIFIER"

     cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
       UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
     end

     cell.textLabel.text = @data[indexPath.row]['event']['name']

     cell
   end

   def tableView(tableView, numberOfRowsInSection: section)
     @data.count
   end

   # when selectd, open new push controller
   def tableView(tableView, didSelectRowAtIndexPath:indexPath)
     tableView.deselectRowAtIndexPath(indexPath, animated: true)
     init_new_push_controller(@data[indexPath.row]['event']['slug'])
   end

   def init_new_push_controller(path)
     controller = DestinyJsonPushController.alloc.initWithTitle(path)
     self.navigationController.pushViewController(controller, animated: true)
   end

end



# First Push Controller
class DestinyJsonPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def viewDidLoad
    self.title = @title
    self.view.backgroundColor = UIColor.whiteColor
    @data = get_info
    table_setup
    right_button = UIBarButtonItem.alloc.initWithTitle("New Post", style: UIBarButtonItemStyleBordered, target:self, action:'create_post')
    self.navigationItem.rightBarButtonItem = right_button
  end

  def create_post
    controller = DestinyCreatePostController.alloc.initWithTitle(@title)
    self.navigationController.pushViewController(controller, animated: true)
  end

  def get_info
    # Our request url, you are going to need a forcase IO api key,
    url_string = "https://ps4-lfg.herokuapp.com/destiny/#{@title}.json"

    # Send the request and encode it for us `app/lib/url_request.rb`
    url_response = UrlRequest.send_request(url_string)

    # Decode the request and parse it as JSON `app/lib/json_parser.rb`
    JsonParser.decode(url_response)
  end

  def table_setup
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
    self.view.addSubview(@table)

    @table.dataSource = self
    @table.delegate = self
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
     @reuseIdentifier ||= "CELL_IDENTIFIER"

     cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
       UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
     end

     cell.textLabel.text = @data[indexPath.row]['post']['title']

     cell
   end

   def tableView(tableView, numberOfRowsInSection: section)
     @data.count
   end

   # when selectd, open new push controller
   def tableView(tableView, didSelectRowAtIndexPath:indexPath)
     tableView.deselectRowAtIndexPath(indexPath, animated: true)
     path = @data[indexPath.row]['post']['event']['slug']
     id = @data[indexPath.row]['post']['id']
     title = @data[indexPath.row]['post']['title']
     init_new_push_controller(path, id, title)
   end

   def init_new_push_controller(path, id, title)
     controller = DestinyShowPostController.alloc.initWith(path, id, title)
     self.navigationController.pushViewController(controller, animated: true)
   end

end


# Show Post Controller
class DestinyShowPostController < UIViewController

  def initWith(path, id, title)
    self.init
    @path     = path
    @id       = id
    @title    = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidAppear(anitmated)
    super
    self.title = @title[0..10] + "..."
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("https://ps4-lfg.herokuapp.com/destiny/#{@path}/posts/#{@id}"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

end


# Create Post Controller
class DestinyCreatePostController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidAppear(anitmated)
    super
    self.title = "New Post"
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("https://ps4-lfg.herokuapp.com/destiny/#{@title}/posts/new"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

end

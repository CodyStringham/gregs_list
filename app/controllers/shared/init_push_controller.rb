class InitPushController

  def initialize(owner, path)
    @owner = owner
    @path = path
  end

  def event_push
    controller = EventShowPushController.alloc.initWithTitle(@path)
    @owner.navigationController.pushViewController(controller, animated: true)
  end

  def post_push
    controller = PostShowPushController.alloc.initWithTitle(@path)
    @owner.navigationController.pushViewController(controller, animated: true)
  end

end

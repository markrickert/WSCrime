class AboutController < UIViewController

  def viewDidLoad
    super

    self.title = "About"
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack

    backButton = UIBarButtonItem.alloc.initWithTitle(
      "Done", 
      style:UIBarButtonItemStyleDone, 
      target:self, 
      action:"goBack")
    self.navigationItem.rightBarButtonItem = backButton;

    self.view = UIWebView.alloc.init
    view.delegate = self

    aboutContent = File.read(App.resources_path + "/AboutView.html")
    baseURL = NSURL.fileURLWithPath(App.resources_path)
    self.view.loadHTMLString(aboutContent, baseURL:baseURL)

  end

  #debugging function to output the html of the webview once loaded.
  #def webViewDidFinishLoad(webView)
  #  p self.view.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('html')[0].outerHTML")
  #end

  def goBack
    self.navigationController.dismissModalViewControllerAnimated(true)
  end

  #Open UIWebView delegate links in Safari.
  def webView(inWeb, shouldStartLoadWithRequest:inRequest, navigationType:inType)
    if inType == UIWebViewNavigationTypeLinkClicked
      UIApplication.sharedApplication.openURL(inRequest.URL)
      false #don't allow the web view to load the link.
    end
    true #return true for local file loading.
  end

end
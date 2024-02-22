import Cocoa
import FlutterMacOS
import IOKit.ps

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    let flavor = Bundle.main.infoDictionary?["Flavor"] as! String;
    print("Flavor : " + flavor);

    let channel = FlutterMethodChannel(name: "flavor", binaryMessenger: flutterViewController.engine.binaryMessenger)
    channel.setMethodCallHandler { (call, result) in
        let flavor = Bundle.main.infoDictionary?["Flavor"]
        result(flavor)
    }
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}

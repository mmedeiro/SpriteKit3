import SpriteKit

// #1
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
    
    // #2
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }
    
    override func update(currentTime: CFTimeInterval) {
        // #3
        if lastTick == nil {
            return
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate()
            tick?()
        }
    }
    
    // #4
    func startTicking() {
        lastTick = NSDate()
        if tick != nil {
            tick!()
        }
    }
    
    func stopTicking() {
        lastTick = nil
        if tick != nil {
            tick!()
        }
    }
   
}
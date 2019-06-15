//
//  LeftController.swift
//  JingMY_Swift
//
//  Created by jing_mac on 2019/6/13.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit
import SnapKit
import MapKit


class LeftController: BaseController {
    
    lazy var mapView: MKMapView = MKMapView()
    lazy var startButton: UIButton = UIButton()
    lazy var rightView: UIView = UIView()
    var isShow: Bool = false
    let lock: NSLock = NSLock()
    lazy var locationManager = CLLocationManager()
    var locationArray: [CLLocationCoordinate2D] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setItems()
        checkLocationPrivate()
        
        testData()
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutItems()
    }
    
    func checkLocationPrivate() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    
    
    func layoutItems() {
        print(view.safeAreaInsets)
        mapView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-view.safeAreaInsets.bottom)
        }
        let startBtnSize = CGSize(width: 100, height: 30)
        
        startButton.snp.makeConstraints {  (maker) in
            maker.size.equalTo(startBtnSize)
            maker.centerY.equalToSuperview()
            maker.centerX.equalTo(wide - startBtnSize.width)
        }
        
    }
    
    func setItems() {
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.delegate = self
        view.addSubview(mapView)
        
        startButton.layer.cornerRadius = 5
        startButton.setTitle("Start", for: .normal)
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startButtonClick(_:)), for: .touchUpInside)
        startButton.backgroundColor = UIColor.white
        
        
    }
    
    @objc func startButtonClick(_ sender:UIButton){
        DispatchQueue.global().async {[weak self] in
            self?.showLine()
        }
    }
    
    //        present(TestTimerController(), animated: true, completion: nil)

}



//MARK:-MKMapViewDelegate

extension LeftController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if !isShow {
            mapView.showAnnotations([userLocation], animated: true)
            isShow = true
        }
        
        lock.lock()
        locationArray.append(userLocation.coordinate)
        lock.unlock()
        
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let lineView = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        lineView.strokeColor = UIColor.blue
        lineView.lineWidth = 5
        return lineView
    }
    
    func testData() {
        let abc = "nameabc"
        let url = URL(fileURLWithPath: abc)
        let ocUrl = NSURL(fileURLWithPath: abc)
        print(url.absoluteString,ocUrl.absoluteString!)
        URL
        
        
    }
    
    func showLine() {
        
        
        var pointArr: [MKMapPoint] = []
        for item in locationArray{
            pointArr.append(MKMapPoint(item))
            print(item)
        }
        let line = MKPolyline(points: pointArr, count: pointArr.count)
        DispatchQueue.main.async {[weak self] in
            let overlays:[MKOverlay] = (self?.mapView.overlays)!
            self?.mapView.removeOverlays(overlays)
            self?.mapView.addOverlay(line)
        }
    }
    
}

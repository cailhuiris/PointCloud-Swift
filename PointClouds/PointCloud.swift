import UIKit

class PointCloud {
    var name:String = ""
    var _points:[Point] = [Point]()
    
    init(_ name:String, _ points:[Point]) {
        let modeler = PointCloudModeler()
        self.name = name
        
        _points = points
        _points = modeler.resample(_points)
        _points = modeler.translateTo(_points, pt:Point(x:0.0, y:0.0, id:0))
        _points = modeler.scale(_points)
    }
    
    func greedyMatch(_ reference:PointCloud) -> Double? {
        if(_points.count != reference._points.count) {
             return nil
        }
        
        let pointCount = Double(_points.count)
        let e = 0.50
        let step = floor(pow(pointCount, 1.0 - e))
        var minValue = Double.infinity
        
        var i = 0.0
        while(i < pointCount) {
            let d1 = self.cloudDistance(reference, start:i)
            let d2 = reference.cloudDistance(self, start:i)
            minValue = min(minValue, min(d1, d2))
            i += step
        }
        
        return minValue
    }
    
    // 이쪽에 null값 때문에 에러날 수도 있겟다
    fileprivate func cloudDistance(_ reference:PointCloud, start:Double) -> Double {
        let pts1 = _points
        let pts2 = reference._points
        let modeler = PointCloudModeler()
        
        let pointCount = Double(_points.count)
        var matched = [Bool](repeating: false, count: _points.count)
        
        var sum = Double(0)
        var i = start
        
        repeat {
            var index = -1
            var min = Double.infinity
            
            for j in 0..<matched.count {
                if(!matched[j]) {
                    let k = Int(i)
                    let d = modeler.getDistance(pts1[k], p2:pts2[j])
                    if(d < min) {
                        min = d
                        index = j
                    }
                }
            }
            
            if index != -1 {
                matched[index] = true
            }
            
            let weight = 1.0 - ((i - start + pointCount).truncatingRemainder(dividingBy: pointCount)) / pointCount
            sum += weight * min
            i = (i + 1.0).truncatingRemainder(dividingBy: pointCount)
        } while(i != start)
        
        return sum
    }
}

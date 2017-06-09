import UIKit

class PointCloudLibrary {
    // empty point cloud array.
    var pointClouds = [PointCloud]()
    
    // return top related gesture from library
    func recognizeFromLibrary(_ inputGesture:PointCloud) -> MatchResult {
        var b = Double.infinity
        var u = -1
        
        for (index, pointCloud) in pointClouds.enumerated() {
            if let d = inputGesture.greedyMatch(pointCloud) {
                if(d < b) {
                    b = d
                    u = index
                }
            }
        }
        
        if(u == -1) {
            return MatchResult(name: "No match", score: 0.0)
        } else {
            let score = round(max((b - 2.0) / -2.0, 0.0) * 100)/100
            return MatchResult(name:pointClouds[u].name, score:score)
        }
    }
    
    static func getDemoLibrary() -> PointCloudLibrary {
        let _library = PointCloudLibrary()
        _library.pointClouds.append(PointCloud("T", [
            Point(x:30, y:7, id:1), Point(x:103, y:7, id:1),
            Point(x:66, y:7, id:2), Point(x:66, y:87, id:2)]))
        _library.pointClouds.append(PointCloud("N", [
            Point(x:177, y:92, id:1), Point(x:177, y:2, id:1),
            Point(x:182, y:1, id:2), Point(x:246, y:95, id:2),
            Point(x:247, y:87, id:3), Point(x:247, y:1, id:3)]))
        _library.pointClouds.append(PointCloud("D", [
            Point(x:345,y:9,id:1),Point(x:345,y:87,id:1),
            Point(x:351,y:8,id:2),Point(x:363,y:8,id:2),Point(x:372,y:9,id:2),Point(x:380,y:11,id:2),Point(x:386,y:14,id:2),Point(x:391,y:17,id:2),Point(x:394,y:22,id:2),Point(x:397,y:28,id:2),Point(x:399,y:34,id:2),Point(x:400,y:42,id:2),Point(x:400,y:50,id:2),Point(x:400,y:56,id:2),Point(x:399,y:61,id:2),Point(x:397,y:66,id:2),Point(x:394,y:70,id:2),Point(x:391,y:74,id:2),Point(x:386,y:78,id:2),Point(x:382,y:81,id:2),Point(x:377,y:83,id:2),Point(x:372,y:85,id:2),Point(x:367,y:87,id:2),Point(x:360,y:87,id:2),Point(x:355,y:88,id:2),Point(x:349,y:87,id:2)
            ]))
        _library.pointClouds.append(PointCloud("P", [
            Point(x:507,y:8,id:1),Point(x:507,y:87,id:1),
            Point(x:513,y:7,id:2),Point(x:528,y:7,id:2),Point(x:537,y:8,id:2),Point(x:544,y:10,id:2),Point(x:550,y:12,id:2),Point(x:555,y:15,id:2),Point(x:558,y:18,id:2),Point(x:560,y:22,id:2),Point(x:561,y:27,id:2),Point(x:562,y:33,id:2),Point(x:561,y:37,id:2),Point(x:559,y:42,id:2),Point(x:556,y:45,id:2),Point(x:550,y:48,id:2),Point(x:544,y:51,id:2),Point(x:538,y:53,id:2),Point(x:532,y:54,id:2),Point(x:525,y:55,id:2),Point(x:519,y:55,id:2),Point(x:513,y:55,id:2),Point(x:510,y:55,id:2)
            ]))
        _library.pointClouds.append(PointCloud("X", [
            Point(x:30,y:146,id:1),Point(x:106,y:222,id:1),
            Point(x:30,y:225,id:2),Point(x:106,y:146,id:2)
            ]))
        _library.pointClouds.append(PointCloud("H", [
            Point(x:188,y:137,id:1),Point(x:188,y:225,id:1),
            Point(x:188,y:180,id:2),Point(x:241,y:180,id:2),
            Point(x:241,y:137,id:3),Point(x:241,y:225,id:3)
            ]))
        _library.pointClouds.append(PointCloud("I", [
            Point(x:371,y:149,id:1),Point(x:371,y:221,id:1),
            Point(x:341,y:149,id:2),Point(x:401,y:149,id:2),
            Point(x:341,y:221,id:3),Point(x:401,y:221,id:3)
            ]))
        _library.pointClouds.append(PointCloud("exclamation", [
            Point(x:526,y:142,id:1),Point(x:526,y:204,id:1),
            Point(x:526,y:221,id:2)
            ]))
        _library.pointClouds.append(PointCloud("line", [
            Point(x:12,y:347,id:1),Point(x:119,y:347,id:1)
            ]))
        _library.pointClouds.append(PointCloud("five-point star", [
            Point(x:177,y:396,id:1),Point(x:223,y:299,id:1),Point(x:262,y:396,id:1),Point(x:168,y:332,id:1),Point(x:278,y:332,id:1),Point(x:184,y:397,id:1)
            ]))
        _library.pointClouds.append(PointCloud("null", [
            Point(x:382,y:310,id:1),Point(x:377,y:308,id:1),Point(x:373,y:307,id:1),Point(x:366,y:307,id:1),Point(x:360,y:310,id:1),Point(x:356,y:313,id:1),Point(x:353,y:316,id:1),Point(x:349,y:321,id:1),Point(x:347,y:326,id:1),Point(x:344,y:331,id:1),Point(x:342,y:337,id:1),Point(x:341,y:343,id:1),Point(x:341,y:350,id:1),Point(x:341,y:358,id:1),Point(x:342,y:362,id:1),Point(x:344,y:366,id:1),Point(x:347,y:370,id:1),Point(x:351,y:374,id:1),Point(x:356,y:379,id:1),Point(x:361,y:382,id:1),Point(x:368,y:385,id:1),Point(x:374,y:387,id:1),Point(x:381,y:387,id:1),Point(x:390,y:387,id:1),Point(x:397,y:385,id:1),Point(x:404,y:382,id:1),Point(x:408,y:378,id:1),Point(x:412,y:373,id:1),Point(x:416,y:367,id:1),Point(x:418,y:361,id:1),Point(x:419,y:353,id:1),Point(x:418,y:346,id:1),Point(x:417,y:341,id:1),Point(x:416,y:336,id:1),Point(x:413,y:331,id:1),Point(x:410,y:326,id:1),Point(x:404,y:320,id:1),Point(x:400,y:317,id:1),Point(x:393,y:313,id:1),Point(x:392,y:312,id:1),
            Point(x:418,y:309,id:2),Point(x:337,y:390,id:2)
            ]))
        _library.pointClouds.append(PointCloud("arrowhead", [
            Point(x:506,y:349,id:1),Point(x:574,y:349,id:1),
            Point(x:525,y:306,id:2),Point(x:584,y:349,id:2),Point(x:525,y:388,id:2)
            ]))
        _library.pointClouds.append(PointCloud("pitchfork", [
            Point(x:38,y:470,id:1),Point(x:36,y:476,id:1),Point(x:36,y:482,id:1),Point(x:37,y:489,id:1),Point(x:39,y:496,id:1),Point(x:42,y:500,id:1),Point(x:46,y:503,id:1),Point(x:50,y:507,id:1),Point(x:56,y:509,id:1),Point(x:63,y:509,id:1),Point(x:70,y:508,id:1),Point(x:75,y:506,id:1),Point(x:79,y:503,id:1),Point(x:82,y:499,id:1),Point(x:85,y:493,id:1),Point(x:87,y:487,id:1),Point(x:88,y:480,id:1),Point(x:88,y:474,id:1),Point(x:87,y:468,id:1),
            Point(x:62,y:464,id:2),Point(x:62,y:571,id:2)
            ]))
        _library.pointClouds.append(PointCloud("six-point star", [
            Point(x:177,y:554,id:1),Point(x:223,y:476,id:1),Point(x:268,y:554,id:1),Point(x:183,y:554,id:1),
            Point(x:177,y:490,id:2),Point(x:223,y:568,id:2),Point(x:268,y:490,id:2),Point(x:183,y:490,id:2)
            ]))
        _library.pointClouds.append(PointCloud("asterisk", [
            Point(x:325,y:499,id:1),Point(x:417,y:557,id:1),
            Point(x:417,y:499,id:2),Point(x:325,y:557,id:2),
            Point(x:371,y:486,id:3),Point(x:371,y:571,id:3)
            ]))
        _library.pointClouds.append(PointCloud("half-note", [
            Point(x:546,y:465,id:1),Point(x:546,y:531,id:1),
            Point(x:540,y:530,id:2),Point(x:536,y:529,id:2),Point(x:533,y:528,id:2),Point(x:529,y:529,id:2),Point(x:524,y:530,id:2),Point(x:520,y:532,id:2),Point(x:515,y:535,id:2),Point(x:511,y:539,id:2),Point(x:508,y:545,id:2),Point(x:506,y:548,id:2),Point(x:506,y:554,id:2),Point(x:509,y:558,id:2),Point(x:512,y:561,id:2),Point(x:517,y:564,id:2),Point(x:521,y:564,id:2),Point(x:527,y:563,id:2),Point(x:531,y:560,id:2),Point(x:535,y:557,id:2),Point(x:538,y:553,id:2),Point(x:542,y:548,id:2),Point(x:544,y:544,id:2),Point(x:546,y:540,id:2),Point(x:546,y:536,id:2)
            ]))
        
        return _library
    }
}

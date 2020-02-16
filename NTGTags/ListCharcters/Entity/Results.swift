/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
class Results : NSObject, Codable, NSCoding {
    let id : Int?
    let name : String?
    let descriptionStr : String?
    var modified : String?
    
    var thumbnail : ThumbnailObject?
    var characterImageBaseString:String!
    var resourceURI : String?
    var comics :BaseModel?
    var series : BaseModel?
    var stories : BaseModel?
    var events : BaseModel?
    var urls : [Urls]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case descriptionStr = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceURI = "resourceURI"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
        case urls = "urls"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        descriptionStr = try values.decodeIfPresent(String.self, forKey: .descriptionStr)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
        
        thumbnail = try values.decodeIfPresent(ThumbnailObject.self, forKey: .thumbnail)
        resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
        comics = try values.decodeIfPresent(BaseModel.self, forKey: .comics)
        series = try values.decodeIfPresent(BaseModel.self, forKey: .series)
        stories = try values.decodeIfPresent(BaseModel.self, forKey: .stories)
        events = try values.decodeIfPresent(BaseModel.self, forKey: .events)
        urls = try values.decodeIfPresent([Urls].self, forKey: .urls)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.modified = aDecoder.decodeObject(forKey: "modified") as? String
        self.descriptionStr = aDecoder.decodeObject(forKey: "descriptionStr") as? String
        self.thumbnail = aDecoder.decodeObject(forKey: "thumbnail") as? ThumbnailObject
        self.characterImageBaseString = aDecoder.decodeObject(forKey: "characterImageBaseString") as? String
        self.comics = aDecoder.decodeObject(forKey: "comics") as? BaseModel
        self.series = aDecoder.decodeObject(forKey: "series") as? BaseModel
        self.stories = aDecoder.decodeObject(forKey: "stories") as? BaseModel
        self.events = aDecoder.decodeObject(forKey: "events") as? BaseModel
        self.urls = aDecoder.decodeObject(forKey: "urls") as? [Urls]
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.modified, forKey: "modified")
        aCoder.encode(self.descriptionStr, forKey: "descriptionStr")
        aCoder.encode(self.thumbnail, forKey: "thumbnail")
        aCoder.encode(self.characterImageBaseString, forKey: "characterImageBaseString")
        aCoder.encode(self.comics, forKey: "comics")
        aCoder.encode(self.series, forKey: "series")
        aCoder.encode(self.stories, forKey: "series")
        aCoder.encode(self.events, forKey: "series")
        aCoder.encode(self.urls, forKey: "series")
        
        
    }
    
    
}

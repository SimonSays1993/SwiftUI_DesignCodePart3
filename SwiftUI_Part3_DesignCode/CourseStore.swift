//
//  CourseStore.swift
//  SwiftUI_Part2_DesignCode
//
//  Created by Simon Mcneil on 2022-01-28.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "0ge8xzmnbp2c", accessToken: "03010b0d79abcb655ca3fda453f2f493b5472e0aaa53664bc7dea5ef4fce2676")

func getArray(id: String, completion: @escaping ([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        let color = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)]
        
        getArray(id: "course") { items in
            items.forEach { item in
                self.courses.append(Course(title: item.fields["title"] as! String,
                                           subtitle: item.fields["subtitle"] as! String,
                                           image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                                           logo: #imageLiteral(resourceName: "Logo1"),
                                           color: color.randomElement()!,
                                           show: false))
            }
        }
    }
}

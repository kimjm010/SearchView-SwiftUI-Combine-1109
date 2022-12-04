//
//  TagView.swift
//  SearchView-SwiftUI-Combine-1109
//
//  Created by Chris Kim on 11/10/22.
//

import Foundation
import SwiftUI
import Combine
import UIKit
import TagListView


class TagViewController: UIViewController {
    
    var tagList = TagListView()
    var viewModel = TagViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagList.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tagList)
        
        NSLayoutConstraint.activate([
            tagList.topAnchor.constraint(equalTo: self.view.topAnchor),
            tagList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tagList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tagList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        tagList.removeTag("To Be Removed")
        tagList.addTags(viewModel.recommendationKeywords)
        tagList.textFont = .systemFont(ofSize: 14)
        tagList.textColor = UIColor().getKeywordsColor()
        tagList.alignment = .leading
        tagList.tagBackgroundColor = .white
        tagList.borderColor = UIColor().getKeywordBorderColor()
        tagList.borderWidth = 1
        tagList.cornerRadius = 8
        tagList.marginX = 10
        tagList.marginY = 10
        tagList.paddingY = 10
        tagList.paddingX = 10
    }
}




extension TagViewController {
    
    private struct TagVCRepresentable: UIViewControllerRepresentable {
        let tagVC: TagViewController
        let tagVM: TagViewModel
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            print(#fileID, #function, #line, "- ")
        }
        
        
        func makeCoordinator() -> Coordinator {
            print(#fileID, #function, #line, "- ")
            return Coordinator(siftUIView: self,
                               tagVC: tagVC,
                               tagVM: tagVM)
        }
        
        
        func makeUIViewController(context: Context) -> some UIViewController {
            print(#fileID, #function, #line, "- ")
            tagVC.tagList.delegate = context.coordinator
            return tagVC
        }
        
        
        final class Coordinator: NSObject, TagListViewDelegate {
            let siftUIView: TagVCRepresentable
            let tagVC: TagViewController
            let tagVM: TagViewModel
            
            init(siftUIView: TagVCRepresentable,
                 tagVC: TagViewController,
                 tagVM: TagViewModel) {
                print(#fileID, #function, #line, "- ")
                self.siftUIView = siftUIView
                self.tagVC = tagVC
                self.tagVM = tagVM
            }
            
            
            // MARK: - TagListView Delegate
            func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
                tagVM.didSelectTagView(tagView)
            }
            
            func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
                print(#fileID, #function, #line, "-tagRemoveButtonPressed: \(title) \(tagView)")
                tagVM.removeTagView(tagView, title: title)
            }
        }
    }
    
    func getRepresentable(vm: TagViewModel) -> some View {
        TagVCRepresentable(tagVC: self, tagVM: vm)
    }
}



extension UIViewController : StoryBoarded {}

protocol StoryBoarded {
    static func instantiate(_ storyboardName: String?) -> Self
}

extension StoryBoarded {
    
    static func instantiate(_ storyboardName: String? = nil) -> Self {
        
        let name = storyboardName ?? String(describing: self)
        
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}


#if DEBUG

import SwiftUI

struct TagViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        TagViewController()
    }
}


struct TagViewControllerPresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TagViewControllerPresentable()
            .previewDevice("iPhone 12")
            .ignoresSafeArea()
    }
}

#endif

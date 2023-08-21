//
//  ShareView.swift
//  WiseWords
//
//  Created by Arsalan Golestanekh on 24.07.2023.
//

import SwiftUI

struct ShareView: UIViewControllerRepresentable {
    var shareText: String

    func makeUIViewController(context: Context) -> UIActivityViewController {
            let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
            return activityViewController
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No need for update as we're not changing anything
    }
}

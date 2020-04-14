//
//  AddScreenViewController.swift
//  MyPersonalNotebook
//
//  Created by Tina Thomsen on 15/03/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class AddScreenViewController: UIViewController {
	
	//Fields
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var imageView: UIImageView!
	var rowNumber = 0
	var noteHead = ""
	var behaveAsNew = true
	
    override func viewDidLoad() {
		super.viewDidLoad()
		
		if behaveAsNew == false{
			showNote()
		}else if behaveAsNew == true{
			
		}
	}
	
	@IBAction func saveNote(_ sender: Any) {
		if behaveAsNew == true{
			insertNewNote()
			CloudStorage.updateNote(index: rowNumber, head: textField.text!, body: textView.text!)
		}else{
			CloudStorage.updateNote(index: rowNumber, head: textField.text!, body: textView.text!)
		}
	}
	
	func showNote(){
		let note = CloudStorage.getNoteAt(index: rowNumber)
		textField.text = note.head
		textView.text = note.body
		if note.image != "empty"{
			CloudStorage.downloadImage(name: note.image, vc: self)
		}else{
			print("Note is empty")
		}
	}
	
	func insertNewNote(){
		let newNote = CloudStorage.createNote(head: textField.text!, body: textView.text!, img: "empty")
		CloudStorage.list.append(newNote)
	}
}

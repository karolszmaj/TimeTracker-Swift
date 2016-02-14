//
//  AddEditTrackingViewController.swift
//  TimeTracker
//
//  Created by razor118 on 07.01.2016.
//  Copyright © 2016 WhallaLabs. All rights reserved.
//

import SwiftForms
import UIKit

class AddEditTrackingViewController: FormViewController {
    var model: TrackingEntry?
    
    override func viewDidLoad() {
        initializeForm()
        super.viewDidLoad()
    }
    
    private func initializeForm() {
        let editMode = model != nil
        var formDefinition = FormDescriptor()
        formDefinition.title = editMode ? "Edit" : "Add"
        
        var basicProjectInfoSection = FormSectionDescriptor()
        basicProjectInfoSection.headerTitle = "Project inforamtion"
        
        let projectRow = FormRowDescriptor(tag: "projectName", rowType: .MultipleSelector, title: editMode ? model!.projectName : "Select project")
        let taskRow = FormRowDescriptor(tag: "task", rowType: .MultipleSelector, title: editMode ? model!.task : "Select task")
        let descriptionRow = FormRowDescriptor(tag: "desc", rowType: .Text, title: editMode ? model!.description : "")
        
        basicProjectInfoSection.addRow(projectRow)
        basicProjectInfoSection.addRow(taskRow)
        basicProjectInfoSection.addRow(descriptionRow)
        
        //second section
        var timeSection = FormSectionDescriptor()
        timeSection.headerTitle = "Time information"
        let durationRow = FormRowDescriptor(tag: "duration", rowType: .Time, title: editMode ? "00:12": "00:00")
        let dateRow = FormRowDescriptor(tag: "date", rowType: .Date, title: editMode ? "" : "asd")
        timeSection.addRow(durationRow)
        timeSection.addRow(dateRow)
        
        //action sections
        var actionSection = FormSectionDescriptor()
        actionSection.headerTitle = "Action"
        let deleteRow = FormRowDescriptor(tag: "del", rowType: .Button, title: "Delete")
        actionSection.addRow(deleteRow)
        
        formDefinition.sections = [basicProjectInfoSection, timeSection, actionSection]
        self.form = formDefinition
        
    }
}
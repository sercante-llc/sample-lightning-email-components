global class HTMLSources extends VisualEditor.DynamicPickList{
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('HTML Option 1', '<h3>default value</h3>');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();
        myValues.addRow(new VisualEditor.DataRow('HTML Option 1', '<h3>default value</h3>'));
        myValues.addRow(new VisualEditor.DataRow('HTML Option 2', '<h1>test html picklist</h1>'));
        myValues.addRow(new VisualEditor.DataRow('HTML Option 3', '<div>hello<p>testing html picklist</p></div>'));
        myValues.addRow(new VisualEditor.DataRow('HTML Option 4', '<h1>hello</h1>'));
        myValues.addRow(new VisualEditor.DataRow('HTML Option 5', '<h2>goodbye</h2>'));
        return myValues;
    }
}
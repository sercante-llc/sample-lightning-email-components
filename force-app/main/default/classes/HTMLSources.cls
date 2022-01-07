global class HTMLSources extends VisualEditor.DynamicPickList{
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('--Select--', '');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows options = new VisualEditor.DynamicPickListRows();
        options.addRow(new VisualEditor.DataRow('HTML Option 1', '<h1>Sample 1, simple header</h1>'));
        options.addRow(new VisualEditor.DataRow('HTML Option 2', '<h3>Sample 2, smaller heading</h3>'));
        options.addRow(new VisualEditor.DataRow('HTML Option 3', '<h4>Sample 3, multiple blocks of HTML</h4><div>hello<p>testing html picklist</p></div>'));
        options.addRow(new VisualEditor.DataRow('HTML Option 4', '<h2>Hello Trailblazer</h2>'));
        options.addRow(new VisualEditor.DataRow('HTML Option 5', '<h2>This was swell</h2>'));
        return options;
    }
}
global with sharing class StarWarsCharacterPicklist extends VisualEditor.DynamicPickList {

    global override Boolean isValid(Object attributeValue){
        return true;
    }

    // When there is no character selected, our default value will tell the LWC to display some help text.
    // You could take a different approach, say selecting the first value from your options
    global override VisualEditor.DataRow getDefaultValue(){
        return new VisualEditor.DataRow('--Select a Character--', 'no-character-selected');
    }

    //We need to send JSON string back. However, due to a bug in AppBuilder (EmailBuilder), DynamicPickList components do not work on save because of {} (curly bracket)
    //We will add this bracket on LWC side for now as a workaround
    global override VisualEditor.DynamicPickListRows getValues() {
        System.debug('Providing Star Wars Character values now!');
        return getApiOptions();
    }

    private VisualEditor.DynamicPickListRows getApiOptions() {
        VisualEditor.DynamicPickListRows pickListRows = new VisualEditor.DynamicPickListRows();

        //Make API call to StarWarsAPI and get a list of characters
        List<StarWarsCharacterServices.StarWarsCharacter> characters = StarWarsCharacterServices.getCharacterList();
        System.debug('Found ' + characters.size() + ' Characters');

        // Now prepare the options for the VisualEditor to consume.
        // When a choice is made from the VisualEditor, the DataRow value will be provided to the LWC
        // We are choosing to have that "value" be a JSON string, so that the LWC can parse it and
        // render the properties as it sees fit
        for(StarWarsCharacterServices.StarWarsCharacter character: characters){
            String characterInfoAsJson = System.JSON.serialize(character);
            pickListRows.addRow(new VisualEditor.DataRow(character.name, characterInfoAsJson));
        }
        return pickListRows;
    }
}

global with sharing class StarWarsCharacterPicklist extends VisualEditor.DynamicPickList {

    private static VisualEditor.DynamicPickListRows pickListRows;

    global StarWarsCharacterPicklist() {
        if(pickListRows!=null) return;
        pickListRows = new VisualEditor.DynamicPickListRows();

        //Make API call to StarWarsAPI and get a list of characters
        List<StarWarsCharacterServices.StarWarsCharacter> characters = StarWarsCharacterServices.getCharacterList();
        System.debug('Found ' + characters.size() + ' Characters');
        for(StarWarsCharacterServices.StarWarsCharacter character: characters){

            String characterInfo = '<div class="card">' +
                '<h2 >' + character.name +'</h2>' + 
                '<p >Height: ' + character.height + 'cm<br/>' +
                    'BirthYear: ' + character.birth_year + '<br/>' +
                    'HairColor: ' +  character.hair_color + '<br/>' +
                    'HomeWorld: ' +  character.homeworld  + '<br/>';
            if(character.films!=null)
                characterInfo = characterInfo + 'Featured in ' +  character.films.size() + ' films<br/>';
            if(character.starships!=null)
                characterInfo = characterInfo + 'Found in ' +  character.starships.size() + ' star ships<br/>';
            
            characterInfo = characterInfo + '</p></div>';
            pickListRows.addRow(new VisualEditor.DataRow(character.name, characterInfo));
        }
    }

    global override Boolean isValid(Object attributeValue){
        return true;
    }

    global override VisualEditor.DataRow getDefaultValue(){
        System.debug('Providing Default Character (the 1st one)');
        return pickListRows.get(0);
    }

    //We need to send JSON string back. However, due to a bug in AppBuilder (EmailBuilder), DynamicPickList components do not work on save because of {} (curly bracket)
    //We will add this bracket on LWC side for now as a workaround
    global override VisualEditor.DynamicPickListRows getValues() {
        System.debug('Providing Star Wars Character values now!');
        return pickListRows;
    }
}

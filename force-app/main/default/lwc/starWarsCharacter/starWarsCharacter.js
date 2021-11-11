import { LightningElement, api } from 'lwc';

export default class StarWarsCharacter extends LightningElement {
    @api
    character = {}
    @api
    characterChosen = false
    @api
    hasFilms = false
    @api
    hasStarships = false

    @api
    set characterJson(value) {
        // the "value" is the DataRow value that came from APEX
        // in our example, this is the JSON encoded string which contains details about our character
        console.log('setting characterJson::', value);
        this._characterJson = value;
        if(value==='no-character-selected') {
            console.log('There has been no character selected yet');
            this.characterChosen = false;
        }
        else {
            try {
                console.log('A StarWars character has been selected, parsing the JSON returned from APEX');
                this.character = JSON.parse(value);
                this.characterChosen = true;
                if(this.character.hasOwnProperty('films') && this.character.films.length > 0) this.hasFilms=true;
                if(this.character.hasOwnProperty('starships') && this.character.starships.length > 0) this.hasStarships=true;
                console.log('ok done');
            }
            catch(ex) {
                console.log('got an exception trying to parse json', ex.message);
                console.log(ex);
            }
        }
    }
    get characterJson() {
        return this._characterJson;
    }
}
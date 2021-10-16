import { LightningElement, api } from 'lwc';

export default class StarWarsCharacter extends LightningElement {
    @api
    set characterInfo(value) {
        if (this.characterElement) {
            console.log('characterInfo value::', value);
            this.characterElement.innerHTML = value;
        }
        this._characterInfo = value;
    }
    get characterInfo() {
        return this._characterInfo;
    }
    


    renderedCallback() {
        this.characterElement = this.template.querySelector('div[ishtmlcontainer=true]');
        this.characterElement.innerHTML = this.characterInfo;
    }}
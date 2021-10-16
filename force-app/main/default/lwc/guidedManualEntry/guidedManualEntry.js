import { LightningElement, api } from 'lwc';

export default class GuidedManualEntry extends LightningElement {

    @api
    set title(value) {
        if (this.titleElement) {
            console.log('title value::', value);
            this.titleElement.innerHTML = value;
        }
        this._title = value;
    }
    get title() {
        return this._title;
    }

    @api
    set imageUrl(value) {
        if (this.imageElement) {
            console.log('imageUrl value::', value);
            this.imageElement.src = value;
        }
        this._imageUrl = value;
    }
    get imageUrl() {
        return this._imageUrl;
    }

    @api
    set description(value) {
        if (this.descriptionElement) {
            console.log('description value::', value);
            this.descriptionElement.innerHTML = value;
        }
        this._description = value;
    }
    get description() {
        return this._description;
    }
    
    renderedCallback() {
        console.log('renderedCallback');
        this.titleElement = this.template.querySelector('.title');
        this.titleElement.innerHTML = this.title;

        this.imageElement = this.template.querySelector('.imageUrl');
        this.imageElement.src = this.imageUrl;

        this.descriptionElement = this.template.querySelector('.description');
        this.descriptionElement.innerHTML = this.description;
    }
}
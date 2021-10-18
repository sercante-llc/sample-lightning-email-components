import { LightningElement, api } from 'lwc';

export default class HtmlPicklist extends LightningElement {
    @api
    set htmlValue(value) {
        if (this.attachmentPoint) {
            this.attachmentPoint.innerHTML = value;
        }
        this._htmlValue = value;
    }
    get htmlValue() {
        return this._htmlValue;
    }
    renderedCallback() {
        this.attachmentPoint = this.template.querySelector('div[ishtmlcontainer=true]');
        this.attachmentPoint.innerHTML = this.htmlValue;;
    }
}
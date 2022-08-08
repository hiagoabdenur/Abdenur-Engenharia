import {
    LightningElement,
    track,
    api,
    wire
} from 'lwc';

export default class ImageDisplay extends LightningElement {

    @api imageUrl;


    //this.imageUrl = '/sfc/servlet.shepherd/version/download/'  + this.id;
}
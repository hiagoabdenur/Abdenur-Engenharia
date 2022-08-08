import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class solicitacaoOrcamento extends LightningElement {
    // objectApiName is "Account" when this component is placed on an account record page
    @api Orcamento__C;

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Orçamento Criado",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}
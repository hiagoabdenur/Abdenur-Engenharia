import { LightningElement, track} from 'lwc';
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import {NavigationMixin} from "lightning/navigation";
import buscarCep from "@salesforce/apex/ForumCbController.buscarEndereco";


export default class formulario extends NavigationMixin(LightningElement) 
{
    @track bairro;
	@track cidade;
	@track estado;
	@track rua;
    Mostrar = false;
	SairDaVisao = true;

	setMostarFormulario()
	{
		this.Mostrar = true;
		this.SairDaVisao = false;
	}

    mudouCEP = async (event) =>  //esta recebendo um async e um event.
   {
		try { 

			this.ultimaChamadaCEP = Date.now(); // peguei a data de agora.
			
			setTimeout(async function ()
			{
					if (this.ultimaChamadaCEP && (Date.now() - this.ultimaChamadaCEP) >= 1000) 
					{
						const {Bairro, Localidade, Logradouro, UF} = await buscarCep({CEP: event.detail.value});
						this.bairro = Bairro;
						this.cidade = Localidade;
						this.rua = Logradouro;
						this.estado = UF;
					}

			}
			.bind(this),1000);

		}
		catch (error) 
		{
			console.error(error);
		}
	}

	handleSuccess(event) 
	{
		this.dispatchEvent(new ShowToastEvent({
				title: "Sucesso!",
				message: "Recebemos sua solicitação, enviamos um e-mail para poder acompanhar o andamento da sua solicitação.",
				variant: "success"
			})
		);

		this[NavigationMixin.Navigate]({type: "standard__recordPage", attributes: {
				recordId: event.detail.id,
				objectApiName: "Orcamento__c",
				actionName: "view"
			}
		});
	}
}
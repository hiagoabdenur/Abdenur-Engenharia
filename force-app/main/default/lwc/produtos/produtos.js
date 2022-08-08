import { LightningElement, track } from 'lwc';
import reformaImagem from '@salesforce/resourceUrl/Reforma';
import construcaoImagem from '@salesforce/resourceUrl/Construcao';
import legalizacaoImagem from '@salesforce/resourceUrl/Legalizacao';
import fundoImagem from '@salesforce/resourceUrl/Fundo';
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import {NavigationMixin} from "lightning/navigation";
import buscarCep from "@salesforce/apex/ForumCbController.buscarEndereco";


export default class Produtos extends NavigationMixin(LightningElement)
{
    @track bairro;
	@track cidade;
	@track estado;
	@track rua;
    reformaPrint = reformaImagem;
    construcaoPrint = construcaoImagem;
    legalizacaoPrint = legalizacaoImagem;
    reformaSelecionado = false;
    construcaoSelecionado = false;
    legalizacaoSelecionado = false;
    mostrarFormulario = false;
    mostrarModal = false;
    get fundoTijolo()
    {
        return `height:500rem;background-image:url(${fundoImagem})`;
    }
    
    reformaProduto()
    {
       this.mostrarModal = true;
       
    }
    
    construcaoProduto(event)
    {
       
    }

    legalizacaoProduto(event)
    {
       
    }
    passarPagina()
    {
        this.mostrarModal = false;
        this.mostrarFormulario = true; 
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
import {
    LightningElement,
    track,
    wire,
    api
} from 'lwc';
import {
    loadScript,
    loadStyle
} from 'lightning/platformResourceLoader';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
import {
    NavigationMixin
} from 'lightning/navigation';

//import FORM_FACTOR from '@salesforce/client/formFactor';
import swiperLib from '@salesforce/resourceUrl/swiper';
import swiperCss from '@salesforce/resourceUrl/swiperCss';
import modalCss from '@salesforce/resourceUrl/modalCss';
import getProdutos from '@salesforce/apex/ExibeProdutosController.getProdutos';

export default class ExibirProdutos extends NavigationMixin(LightningElement) {

    @track swiper;
    @track openModal = false;
    @track produtosImagens;
    @track buscado;
    @track listaImagensModal;


    @wire(getProdutos, {})
    wiredGetProdutos({
        error,
        data
    }) {

        if (error) {
            console.log('error: ' + error);
        } else if (data) {

            const dt = JSON.parse(JSON.stringify(data));
            this.produtosImagens = dt.map((d) => {
                d.style = `background-image: url(${d.capa});background-size: cover;background-position: center center;`;
                return d;
            });
            //console.log(JSON.stringify(this.produtosImagens));

        }
    }
    //Carrega as bibliotecas dos recursos estáticos
    renderedCallback() {
        Promise.all([
                loadScript(this, swiperLib),
                loadStyle(this, swiperCss),
                loadStyle(this, modalCss)
            ])
            .then(() => {
                this.iniciarSwiper();
            })
            .catch(error => {
                const evt = new ShowToastEvent({
                    title: 'Erro.',
                    message: 'js e css não carregados.',
                    variant: 'error'
                });
                this.dispatchEvent(evt);
            });
    }

    iniciarSwiper() {
        var swiper = new Swiper(this.template.querySelector('.swiper-container'), {
            direction: 'horizontal',
            slidesPerView: 3,
            slidesPerGroup: 3,
            //loop:true,
            spaceBetween: 50,
            //visibilityFullFit: true,
            pagination: {
                el: this.template.querySelector('.swiper-pagination'),
                clickable: true,
            },
            //nextButton: this.template.querySelector('.swiper-button-next'),
            //prevButton: this.template.querySelector('.swiper-button-prev'),
            //centeredSlides: true,
        });
    }

    clickImagem(event) {
        console.log('current target id: ');

        var idProduto = event.currentTarget.id.split('-');
        for (let i = 0; i < this.produtosImagens.length; ++i) {
            console.log(this.produtosImagens[i].produto.Id);
            if (idProduto[0] === this.produtosImagens[i].produto.Id) {

                this.listaImagensModal = this.produtosImagens[i].listaImagens;
            }
        }
        console.log(this.listaImagensModal);
        this.openModal = true;
    }

    fecharModal() {
        this.openModal = false;
    }
}